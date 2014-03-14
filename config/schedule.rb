every 2.minutes do
  rake "feeds:update", environment: 'development'
end

every 30.minutes do
  rake "feeds:update", environment: 'production'
end