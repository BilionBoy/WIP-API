# frozen_string_literal: true

require "rails/generators"

class ApiScaffoldGenerator < Rails::Generators::NamedBase
  argument :attributes, type: :array, default: []

  def generate_all
    attrs = attributes.map(&:to_s)

    invoke "scaffold:api:model",      [ name ] + attrs
    invoke "scaffold:api:migration",  [ name ] + attrs
    invoke "scaffold:api:controller", [ name ] + attrs
    invoke "scaffold:api:serializer", [ name ]
  end
end
