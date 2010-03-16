require 'capistrano/version'
load 'deploy'

set :application, "ipad"

set :repository,  " git@github.com:boboroshi/Did-You-Buy-an-iPad.git"
set :deploy_to, "/var/www/railsapps/#{application}"
set :scm, "git"
set :branch, "master"
#set :scm_user, "boboroshi"
set :scm_passphrase, "hamh0ck12" #This is your custom users password
ssh_options[:forward_agent] = true

set :domain,  "didyoubuyanipad.com"
set :user,    "jathayde"
default_run_options[:pty] = true

set :deploy_via, :remote_cache

role :web, "67.23.20.48"
role :app, "67.23.20.48"
role :db, "67.23.20.48", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup"

desc "Tail the production log"
task :tail, :roles => :app do
  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end


# If you have previously been relying upon the code to start, stop 
# and restart your mongrel application, or if you rely on the database
# migration code, please uncomment the lines you require below

# If you are deploying a rails app you probably need these:

# load 'ext/rails-database-migrations.rb'
# load 'ext/rails-shared-directories.rb'

# There are also new utility libaries shipped with the core these 
# include the following, please see individual files for more
# documentation, or run `cap -vT` with the following lines commented
# out to see what they make available.

# load 'ext/spinner.rb'              # Designed for use with script/spin
# load 'ext/passenger-mod-rails.rb'  # Restart task for use with mod_rails
# load 'ext/web-disable-enable.rb'   # Gives you web:disable and web:enable

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
# see a full list by running "gem contents capistrano | grep 'scm/'"