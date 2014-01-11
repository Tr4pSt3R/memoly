require 'capistrano/ext/multistage'

# MULTI-STAGE
set :stages, ["staging", "production"]
set :default_stage, :staging

# APPLICATION SETUP
set :application, "memoly"

# GET FROM HERE
set :scm,            :git
set :repository,     "git@github.com:Tr4pSt3R/memoly.git"
set :scm_passphrase, ""

set :user, "root"

#Improve Performance like this
set :deploy_via, :remote_cache

namespace :deploy do 
    task :restart, :roles => :web do 
      run "touch #{current_path}/tmp/restart.txt"
    end

    task :restart_daemons, :roles => :app do 
      sudo "monit restart all -g daemons"
    end
end
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
