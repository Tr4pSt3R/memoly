server "162.243.25.180", :web, :app, :db, primary: true
set :branch, "memoly_core"
set :deploy_to, "/var/www/memoly_staging"