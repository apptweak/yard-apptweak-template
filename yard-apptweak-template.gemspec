# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "yard-apptweak-template/version"
require "bundler"

Gem::Specification.new do |spec|
  spec.name         = "yard-apptweak-template"
  spec.version      = ApptweakTemplateYARD::VERSION
  spec.homepage     = "https://github.com/apptweak/yard-apptweak-template"
  spec.authors      = ["AppTweak DevEx squad"]

  spec.summary      = "Custom YARD template for AppTweak Ruby documentation with enhanced styling and features."
  spec.description  = "Custom YARD template for AppTweak Ruby documentation with enhanced styling and features. Provides improved HTML rendering and documentation organization for better readability and navigation. This template is designed to create consistent, professional-looking documentation for Ruby projects."
  spec.platform = Gem::Platform::RUBY

  spec.required_ruby_version = ">= 3.3.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["github_repo"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rouge", "~> 3.26"
  spec.add_dependency "yard", "~> 0.9.37"
end
