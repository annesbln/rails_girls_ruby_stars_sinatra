require "sinatra"
require "erb"

get "/" do
  "<html><body><h1>Hello World!</h1></body></html>"
end

get "/say_hello/:name" do
  "<html><body><h1>Hello #{params[:name]}!</h1></body></html>"
end

get "/use_erb/:name" do
  ERB.new("<html><body><h1>Hello <%= params[:name] %>!</h1></body></html>").result(binding)
end
