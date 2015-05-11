role :app, %w{deploy@45.33.26.213}
role :web, %w{deploy@45.33.26.213}
role :db,  %w{deploy@45.33.26.213}

server '45.33.26.213', user: 'deploy', roles: %w{web app}

set :ssh_options, {
    keys: %w(/home/action/.ssh/id_rsa),
    forward_agent: true,
    user: 'deploy'
  }