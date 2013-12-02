require 'capistrano/ext/multistage'
require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, :local        # use the same ruby as used locally for deployment

# before 'deploy', 'rvm:install_rvm'  # install/update RVM
# before 'deploy', 'rvm:install_ruby' # install Ruby and create gemset (both if missing)

# APPLICATION SETUP
set :application, "memoly"

# MULTI-STAGE
set :stages, %w(staging)
set :default_stage, :staging

set :ssh_options, {:forward_agent => true}

default_run_options[:pty] = true
set :use_sudo, false

# GET FROM HERE
set :scm,           :git
set :repository,    "git@github.com:Tr4pSt3R/memoly.git"
# set :deploy_via,    :remote_cache
set :use_sudo,      false
set :keep_release,  1

if ENV['BRANCH'].nil?
  set :branch,  -> {"#{rails_env}" == 'production' ? :release : :master }
else
  set :branch, "#{ENV['BRANCH']}"
end

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
    # run "mkdir -p #{shared_path}/config"
    # put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    # puts "Now edit the config files in #{shared_path}."
  end

  after "deploy:finalize_update", "deploy:setup"

  # desc "Make sure local git is in sync with remote."
  # task :check_revision, roles: :web do
  #   unless `git rev-parse HEAD` == `git rev-parse origin/master`
  #     puts "WARNING: HEAD is not the same as origin/master"
  #     puts "Run `git push` to sync changes."
  #     exit
  #   end
  # end
  # before "deploy", "deploy:check_revision"
end