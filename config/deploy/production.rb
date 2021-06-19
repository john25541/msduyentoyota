set :stage, :production
set :rails_env, :production
set :deploy_to, "/deploy/apps/msduyentoyota"
set :branch, :Master
server '153.92.5.100', user: 'root', roles: %w(web app db)