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