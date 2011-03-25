require "bundler/capistrano"

set :application, "fasttrack"
set :repository,  "git://github.com/jaemar/fasttrack-case-study.git"
set :deploy_to, "/home/bry/capistrano/fasttrack"

set :scm, :git

default_run_options[:pty] = true

server "bryanbibat.net", :app, :web, :db, :primary => true
set :user, "bry"
depend :remote, :gem, "bundler"
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

task :copy_production_database_configuration do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end
after "deploy:update_code", :copy_production_database_configuration

