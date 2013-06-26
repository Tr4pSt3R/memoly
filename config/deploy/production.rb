set :user, "ec2-user"
set :deploy_via, :copy

server "ec2-54-216-148-176.eu-west-1.compute.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/ec2_keypair.pem"]
ssh_options[:forward_agent] = true