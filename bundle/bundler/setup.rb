require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/concurrent-ruby-1.1.4/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/i18n-1.5.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/minitest-5.11.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/thread_safe-0.3.6/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/tzinfo-1.2.5/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/activesupport-5.2.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/ast-2.4.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/backport-0.3.0/lib"
$:.unshift "#{path}/"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/diff-lcs-1.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/htmlentities-4.3.4/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/extensions/x86_64-darwin-17/2.6.0/jaro_winkler-1.5.2"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/jaro_winkler-1.5.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/kramdown-1.17.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/mini_portile2-2.4.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/extensions/x86_64-darwin-17/2.6.0/nokogiri-1.10.1"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/nokogiri-1.10.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/parallel-1.13.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/parser-2.6.0.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/powerpack-0.1.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rainbow-3.0.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/reverse_markdown-1.1.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rspec-support-3.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rspec-core-3.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rspec-expectations-3.8.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rspec-mocks-3.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rspec-3.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/ruby-progressbar-1.10.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/unicode-display_width-1.4.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rubocop-0.64.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rufo-0.5.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/thor-0.20.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/tilt-2.0.9/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/yard-0.9.18/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/solargraph-0.31.3/lib"
