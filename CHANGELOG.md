# Changelog
All notable changes to "simple_proxy" will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2023-09-24

### Added
- Initial release of the simple_proxy gem.
- Basic proxy features using Sinatra and HTTParty.
- Support for cross-origin resource sharing (CORS) with `Sinatra::CrossOrigin`.
- GET, POST, PUT, HEAD and DELETE HTTP methods are now supported via '/proxy' endpoint.
- Added the ability to proxy requests, with support for transferring headers and parameters.
- Introduced a mechanism for starting and stopping the server using `self.run!` and `self.quit!` methods.
- Configured the server to bind to '0.0.0.0' and listen on port 4567.

[Unreleased]: https://github.com/your_username/simple_proxy/compare/v1.0.0...HEAD
[1.0.1]: https://github.com/your_username/simple_proxy/releases/tag/v1.0.1
