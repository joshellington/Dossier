task :get_basecamp => :environment do
  url = 'https://basecamp.com/1775043/api/v1/projects/1115321/topics.json'
  res = JSON.parse(open(url, :http_basic_authentication => ['joshellington', '####']).read)

  pp res
end