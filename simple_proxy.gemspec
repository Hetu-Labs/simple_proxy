# frozen_string_literal: true

require_relative "lib/simple_proxy/version"

Gem::Specification.new do |spec|
  spec.name = "simple_proxy"
  spec.version = SimpleProxy::VERSION
  spec.authors = ["Arjun Verma"]
  spec.email = ["arjun.verma@hetu-labs.com"]

  spec.summary = "This gem is a pivotal component in a suite of Developer Productivity Software, specifically designed to resolve CORS restrictions that occur when the frontend and backend domains are different. It aims to eliminate the impediments in the Software Development Life Cycle (SDLC), ensuring smoother and more efficient development processes, thereby significantly reducing SDLC turnaround times."
  spec.description = "The gem in development is part of a suite of Developer Productivity Software that is strategically designed to enhance efficiency and productivity during the Software Development Life Cycle (SDLC). It mainly addresses the limitations and blockades encountered due to Cross-Origin Resource Sharing (CORS) policies that often hinder smooth interaction between the frontend and backend components when hosted on different domains."
  spec.homepage = "https://www.hetu-labs.com/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Hetu-Labs/simple_proxy"
  spec.metadata["changelog_uri"] = "https://github.com/Hetu-Labs/simple_proxy/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir        = "bin"
  spec.executables   = ["simple_proxy"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_runtime_dependency "sinatra", "~> 3.1.0"
  spec.add_runtime_dependency "httparty", "~> 0.21.0"
  spec.add_runtime_dependency "sinatra-cross_origin", "~> 0.4.0"
end
