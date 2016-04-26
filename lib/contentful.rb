require 'contentful'
require 'json'

client = Contentful::Client.new(
  access_token: '02659937c371a6a280357328975bdd4dc20a93088562ea57e5afd994a3f1c0da',
  space: '3krbnkw0yfcf'
)

entries = client.entries(content_type: 'service')

array = []

entries.each_with_index do |entry, index|
  array << entry.fields
end

File.write('data/services.json', array.to_json)
p array.to_json