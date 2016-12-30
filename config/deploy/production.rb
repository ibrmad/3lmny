set :stage, :production
server '138.68.134.128', user: 'deploy', roles: %w{web app db}
