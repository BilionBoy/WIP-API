# frozen_string_literal: true

require "rails/generators"

class ApiScaffoldGenerator < Rails::Generators::NamedBase
  argument :attributes, type: :array, default: []

  def generate_all
    attrs = attributes.map(&:to_s)

    invoke "scaffold:api:model",      [ name ] + attrs
    invoke "scaffold:api:migration",  [ name ] + attrs
    invoke "scaffold:api:controller", [ name ] + attrs
    invoke "scaffold:api:serializer", [ name ] + attrs

    add_api_route
  end

  private

  def add_api_route
    route <<~RUBY
      namespace :api do
        namespace :v1 do
          resources :#{file_name.pluralize}
        end
      end
    RUBY
  end
end
