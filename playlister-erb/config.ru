require 'rack'
require 'erb'
require 'pry-debugger'

require "./environment"
require './web_app'

parser = LibraryParser.new('./data')
parser.call

main = WebApp::Main.new
index = WebApp::Index.new(main)
artists = WebApp::Artists.new(main)
songs = WebApp::Songs.new(main)
genres = WebApp::Genres.new(main)

app = Rack::URLMap.new(
  '/' => index,
  '/artists' => artists,
  '/genres' => genres,
  '/songs' => songs
)

# use WebApp::Artists, :urls => ['/artists']
run Rack::Handler::WEBrick.run(app, {:Port => 3000})
