require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") }
end

require 'sidekiq/web'

map '/sidekiq' do
  run Sidekiq::Web
end
