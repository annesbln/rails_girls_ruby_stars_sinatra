require "sinatra"

get "/" do
  "<html><body><h1>Hello World!</h1></body></html>"
end

get "/say_hello/:name" do
  "<html><body><h1>Hello #{params[:name]}!</h1></body></html>"
end
