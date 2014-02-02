require 'rails/generators'

class JexboxGenerator < Rails::Generators::Base
  desc "Create a Jexbox configuration file at config/initializers/jexbox.rb"

  class_option :api_key, :aliases => '-k', :type => :string,
               :desc => 'The Jexbox API key for this application'


  source_root File.expand_path("../../../templates", __FILE__)

  def install
    unless options[:api_key]
      puts "Must set --api-key to a valid value"
      exit
    end

    unless File.exists?('config/initializers/jexbox.rb')
      template 'initializer.rb', 'config/initializers/jexbox.rb'
    end
  end

  def configuration_output
    output = <<-EOF
Jexbox.configure do |config|
  config.api_key = '#{options[:api_key]}'
end
    EOF
  end
end
