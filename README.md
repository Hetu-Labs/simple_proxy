

<div>
  <img src="./assets/logo.png" alt="Simple Proxy Logo" width="50" style="border-radius: 16px; display:inline; vertical-align: middle;">
  <h1 style="display:inline; vertical-align: middle; margin-left: 10px;">Simple Proxy</h1>
</div> <br>


[![Build Status](https://travis-ci.com/username/projectname.svg?branch=main)](https://travis-ci.com/username/projectname)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/simple_proxy.svg)](https://badge.fury.io/rb/simple_proxy)
[![Downloads](https://img.shields.io/gem/dt/simple_proxy.svg)](https://rubygems.org/gems/simple_proxy)
[![Documentation](https://img.shields.io/badge/docs-rubydoc.info-blue.svg)](https://rubydoc.info/github/Hetu-Labs/simple_proxy)

**Simple Proxy** is a lightweight and easy-to-use proxy server built with Ruby, Sinatra, and HTTParty. It's designed to forward requests to specified target URLs, making it a versatile tool for developers working with APIs and web services.

## Features

- Supports GET, POST, and PUT HTTP methods.
- Supports Cross-Origin Resource Sharing (CORS) with `Sinatra::CrossOrigin`.
- Transfers headers and parameters to the target URL.
- Provides mechanisms for starting and stopping the server.

## Installation

To install Simple Proxy, you can add this line to your application's Gemfile:

```ruby
gem 'simple_proxy'
```
and then execute:

```bash
bundle install
```

or simply install it from the command line:

```bash
gem install simple_proxy
```

## Usage

To use Simple Proxy, you can require it in your application:

```ruby
require 'simple_proxy'
```

#### Starting the Server
To start the server:

```ruby
SimpleProxy.run!
```

#### Stopping the Server
To stop the server:

```ruby
SimpleProxy.quit!
```

#### CLI
You can also start or stop the server from the command line:

```bash
simple_proxy start
```

```bash
simple_proxy stop
```

#### Proxying Requests
To proxy requests, you can use the '/proxy' endpoint:

```ruby
get '/proxy' do
  SimpleProxy.proxy(params, request)
end
```

##### Making Proxy Requests
Once the server is running, you can make proxy requests to the following endpoints:

* GET /proxy?url=target_url
* POST /proxy?url=target_url
* PUT /proxy?url=target_url
* HEAD /proxy?url=target_url
* DELETE /proxy?url=target_url

Replace target_url with the URL you want to proxy the request to.

## Contributing
Contributions are welcome! Please read our [Code of Conduct](https://github.com/your_username/simple_proxy/blob/main/CODE_OF_CONDUCT.md) before contributing to help this project stay welcoming.

* Fork it (https://github.com/Hetu-Labs/simple_proxy/fork)
* Create your feature branch (git checkout -b feature/fooBar)
* Commit your changes (git commit -am 'Add some fooBar')
* Push to the branch (git push origin feature/fooBar)
* Create a new Pull Request

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/your_username/simple_proxy/blob/main/LICENSE.txt) file for details.

## Code of Conduct
Please note that this project is released with a Contributor [Code of Conduct](https://github.com/your_username/simple_proxy/blob/main/CODE_OF_CONDUCT.md). By participating in this project, you agree to abide by its terms.

## Changelog
For all notable changes made to this project, see the [Changelog](https://github.com/your_username/simple_proxy/blob/main/CHANGELOG.md).
