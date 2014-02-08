require "bundler/capistrano"
require "whenever/capistrano"
require "sidekiq/capistrano"
require "rvm/capistrano"

# set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
# set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

# before 'deploy:setup', 'rvm:install_rvm'  # install/update RVM
# before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:
# before 'deploy:setup', 'rvm:create_gemset' # only create gemset

server "162.243.25.180", :app, :web, :db, :primary => true

set :application, "memoly"
set :user, "root"
set :port, 22

set :deploy_to, "/var/www/memoly_staging"

set :deploy_via, :remote_cache
set :use_sudo, false

set :scm,            :git
set :repository,     "git@github.com:Tr4pSt3R/memoly.git"
set :branch,         "master"

set :whenever_command, 'bundle exec whenever'
# set :sidekiq_cmd, "bundle exec sidekiq" 

default_run_options[:pty] = true

ssh_options[:forward_agent] = true
# ssh_options[:auth_methods] = %w(password)

# set ssh_options, {
#   verbose: :debug, 
#   forward_agent: true, 
#   auth_methods: %w(password)
# }

set :keep_releases, 5
after "deploy", "deploy:cleanup"  #keep only the last five releases

namespace :deploy do 
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do 
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do 
    # sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/nginx.conf"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"
  after 'deploy:update_code','whenever:update_crontab'

  # Precompile Assets Locally for CapDeploy
  # http://www.rostamizadeh.net/blog/2012/04/14/precompiling-assets-locally-for-capistrano-deployment
  before 'deploy:finalize_update', 'deploy:assets:symlink'
  after 'deploy:migrate', 'deploy:assets:precompile'
  namespace :assets do
    task :precompile, :roles => :web do
      from = source.next_revision(current_revision)
      run_locally("rake assets:clean && rake assets:precompile")
      run_locally "cd public && tar -jcf assets.tar.bz2 assets"
      top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
      run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
      run_locally "rm public/assets.tar.bz2"
      run_locally("rake assets:clean")
      
      # if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
      #   run_locally("rake assets:clean && rake assets:precompile")
      #   run_locally "cd public && tar -jcf assets.tar.bz2 assets"
      #   top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
      #   run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
      #   run_locally "rm public/assets.tar.bz2"
      #   run_locally("rake assets:clean")
      # else
      #   logger.info "Skipping asset precompilation because there were no asset changes"
      # end
    end

    task :symlink, roles: :web do
      run ("rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets")
    end
  end


  desc "Run migration"
  task :migrate do 
    begin
      run "cd #{latest_release} && bundle exec rake RAILS_ENV=#{rails_env} db:migrate"
    rescue
      run "cd #{latest_release} && bundle exec rake RAILS_ENV=#{rails_env} db:setup"
    end
  end

  task :symlink_config, roles: :app do 
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote"
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes"
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
