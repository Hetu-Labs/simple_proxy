# frozen_string_literal: true

require_relative "simple_proxy/version"
require 'sinatra/base'
require 'httparty'
require 'sinatra/cross_origin'

module SimpleProxy
  class Error < StandardError; end

  class App < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, 4567

    configure do
      set :logging, nil
      set :dump_errors, false
      set :raise_errors, false
      register Sinatra::CrossOrigin
      enable :cross_origin
    end

    before do
      cross_origin
    end

    # routes for the proxy server
    options "*" do
      response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
      response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, X-Api-Key"
      200
    end


    # Handle GET requests
    get '/proxy' do
      proxy_request(:get)
    end

    # Handle POST requests
    post '/proxy' do
      proxy_request(:post)
    end

    # Handle PUT requests
    put '/proxy' do
      proxy_request(:put)
    end

    # Handle HEAD requests
    put '/proxy' do
      proxy_request(:head)
    end

    # Handle DELETE requests
    put '/proxy' do
      proxy_request(:delete)
    end

    def proxy_request(method)
      target_url = params['url']

      # Remove 'url' from params to avoid sending it in the query parameters
      params.delete('url')

      options = {
        query: params, # Send remaining params as query parameters
        headers: extract_request_headers
      }

      if [:post, :put].include?(method)
        options[:body] = request.body.read
        options[:headers]['Content-Type'] = 'application/json'
      end

      response = HTTParty.send(method, target_url, options)

      content_type response.headers['content-type']
      headers 'Accept-all' => 'true' # Add the Accept-all header to the response

      response.body
    end

    def extract_request_headers
      headers = {}
      env.each do |key, value|
        # HTTP_HEADER_NAME format is how Rack sends headers
        if key.start_with?('HTTP_') && !['HTTP_VERSION', 'HTTP_HOST'].include?(key)
          # Convert HTTP_HEADER_NAME to Header-Name
          header_name = key[5..-1].split('_').collect(&:capitalize).join('-')
          headers[header_name] = value
        end
      end
      headers
    end

    # start the server
    def self.run!
      pid = Process.fork do
        $stderr.reopen(File.new('/dev/null', 'w'))
        $stdout.reopen(File.new('/dev/null', 'w'))
        super()
      end
      File.write('simple_proxy.pid', pid)
    end

    # stop the server
    def self.quit!
      if File.exist?('simple_proxy.pid')
        pid = File.read('simple_proxy.pid').to_i
        Process.kill("TERM", pid)
        File.delete('simple_proxy.pid')
      else
        puts "No running instance found"
      end
    end
  end
end
