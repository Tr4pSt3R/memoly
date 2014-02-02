require 'capistrano/ext/multistage'

server "162.243.25.180", :web, :app, :db, primary: true

# MULTI-STAGE
set :stages, ["staging", "production"]
set :default_stage, :staging


# APPLICATION SETUP
set :application, "memoly"

set :user, "root"
set :port, 22
set :deploy_to, "/home/rails/"
set :deploy_via, :copy
set :use_sudo, false

set :ssh_options, {:forward_agent => true}

set :scm, "git"
set :repository, "git@github.com:Tr4pSt3R/memoly.git"
set :branch, "memoly_core"
set :scm_passphrase, ""

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
