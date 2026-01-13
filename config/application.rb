# frozen_string_literal: true

require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Apirails
  class Application < Rails::Application
    config.load_defaults 7.2

    # ----------------------------
    # Autoload / Zeitwerk
    # ----------------------------
    config.autoload_paths << Rails.root.join("lib")
    config.autoload_lib(ignore: %w[assets tasks])

    # ----------------------------
    # Generators (CRÍTICO)
    # ----------------------------
    # Isso é o que faz o override do scaffold funcionar
    config.paths.add "lib/generators", eager_load: true

    # ----------------------------
    # App config
    # ----------------------------
    config.api_only = true

    config.time_zone = "La Paz"
    config.i18n.default_locale = :"pt-BR"
  end
end
