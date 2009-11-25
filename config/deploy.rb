set :user, "avtervo"
set :use_sudo, false
set :application, "application"
set :repository,  "git@github.com:arttu/rails-kurssi.git"

set :scm, :git
set :branch, "master"
set :deploy_via, :copy
set :deploy_to, "$HOME/application"
set :keep_releases, 3

set :gateway, "melkki"

role :web, "rails"                          # Your HTTP server, Apache/etc
role :app, "rails"                          # This may be the same as your `Web` server
role :db,  "rails", :primary => true # This is where Rails migrations will run

before "deploy:restart", "deploy:migrate"
after "deploy:symlink", "deploy:symlink_rails"
after "deploy:symlink", "deploy:copy_configs"
after "deploy", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :migrate do
    run ". $HOME/.railsrc.conf; cd $HOME/rails; rake db:migrate"
  end
  
  task :symlink_rails do
    run "ln -s $HOME/application/current $HOME/rails"
  end
  
  task :copy_configs do
    run "cp $HOME/database.yml rails/config/database.yml"
  end
end

namespace :db do
  task :load_sample_data do
    puts ". $HOME/.railsrc.conf; cd $HOME/rails; rake db:seed #{ARGV[1..-1].join(" ")}"
  end
end

namespace :logs do
  task :show_last_100 do
    run ". $HOME/.railsrc.conf; cd $HOME/rails; tail -n 100 log/production.log"
  end
  
  task :tail do
    run ". $HOME/.railsrc.conf; cd $HOME/rails; tail -f log/production.log"
  end
end