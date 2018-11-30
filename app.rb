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

get "/use_sinatra_supported_erb/:name" do
  # erb "<html><body><h1>Hello <%= name %>!</h1></body></html>", { :locals => { :name => params[:name] } }
  erb "<html><body><h1>Hello <%= name %>!</h1></body></html>", { :locals => params }
end

get "/use_layouts/:name" do
  layout = "<html><body><%= yield %></body></html>"
  template = "<h1>Hello <%= name %>!</h1>"

  erb template, { :locals => params, :layout => layout }
end

get "/use_view_files/:name" do
  erb :hello_name, { :locals => params, :layout => :layout }
end

get "/use_instance_variables/:name" do
  @name = params[:name]

  erb :hello_with_instance_variable
end
