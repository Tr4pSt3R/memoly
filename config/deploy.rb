require "bundler/capistrano"
require "rvm/capistrano"

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

default_run_options[:pty] = true

ssh_options[:forward_agent] = true

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
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  after "deploy:migrate", "deploy:precompile_assets"
  task :precompile_assets do
    puts "Rails Env: #{rails_env}"
    # run "cd #{latest_release} && bundle exec rake RAILS_ENV=#{rails_env} assets:precompile:primary"
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

# require 'capistrano/ext/multistage'

# # MULTI-STAGE
# set :stages, ["staging", "production"]
# set :default_stage, :staging

# # APPLICATION SETUP
# set :application, "memoly"

# # GET FROM HERE
# set :scm,            :git
# set :repository,     "git@github.com:Tr4pSt3R/memoly.git"
# set :scm_passphrase, ""

# set :user, "root"

# #Improve Performance like this
# set :deploy_via, :remote_cache

# namespace :deploy do 
#     task :restart, :roles => :web do 
#       run "touch #{current_path}/tmp/restart.txt"
#     end

#     task :restart_daemons, :roles => :app do 
#       sudo "monit restart all -g daemons"
#     end
# end
# =======
# set :application, 'memoly'
# set :deploy_user, 'root'

# set :scm, :git
# set :repo_url, 'git@github.com:Tr4pSt3R/memoly.git'

# # ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# # set :deploy_to, '/var/www/my_app'

# set :rvm_type, :user
# set :rvm_ruby_version, '1.9.3'

# # set :format, :pretty
# # set :log_level, :debug
# # set :pty, true

# # set :linked_files, %w{config/database.yml}
# # set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# # set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

# namespace :deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

#   after :finishing, 'deploy:cleanup'

# end
# >>>>>>> b16edc076475691633a72f536eef28d459933fe0
