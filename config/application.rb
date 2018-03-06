require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BattleMaker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    #日本語化対応
    config.i18n.default_locale = :ja
    
    #タイムゾーン設定：東京
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
