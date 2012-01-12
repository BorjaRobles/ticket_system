require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end

module TicketSistem
  class Application < Rails::Application
    
    config.generators do |g|
     g.test_framework :rspec, :fixture => true, :views => false
     g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    
    config.encoding = "utf-8"    
    config.filter_parameters += [:password]    
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
