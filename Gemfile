# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in yard-apptweak-template.gemspec
gemspec

gem "rake", "~> 12.0", require: false

group :development do
  gem "base64"
  # For running checks in git
  gem "lefthook", "~> 1.8", require: false
  gem "pronto", "~> 0.11.1", require: false
  gem "pronto-rubocop", require: false
  gem "webrick", require: false
  gem "rubocop", "~> 1.68", require: false
  gem "rubocop-performance", "~> 1.22", require: false
  gem "rubocop-rake", "~> 0.6", require: false
  gem "rubocop-yard", "~> 0.9", require: false

  gem "yard-junk", require: false
  gem "yard-markdown", require: false
end

group :tools do
  gem "colorize", "~> 0.0", require: false
  gem "git", "~> 1.3", require: false
  gem "git_diff_parser", "~> 2.3", require: false
  gem "thor", "~> 0.19", require: false
end
