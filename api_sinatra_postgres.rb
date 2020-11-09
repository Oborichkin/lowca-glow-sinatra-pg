require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'

%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

get '/' do
    "Hi! I am api_sinatra_postgres!\n\n"
end
