require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Loja
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # teste
    config.active_support.key_generator_hash_digest_class = OpenSSL::Digest::SHA1

    # teste para suprimir o erro do webconsole ativando-o na rede toda
    config.web_console.whitelisted_ips = '192.168.0.0/16'
  end
end
