server "162.243.25.180", :web, :app, :db, primary: true
set :branch, "memoly_core"
set :deploy_to, "/var/www/memoly_staging"
set :rails_env, 'production'

# set :deploy_to, "/home/rails/"

# Bundler
set :bundle_without,  [:development, :test]

# Config files
# set :config_files, %w(database.yml settings.yml)

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
