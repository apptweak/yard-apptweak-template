# frozen_string_literal: true

module ApptweakTemplateYARD
  # Handles the definition of class constants defined in the Ruby code using
  # the `DEFINE_RUBY_CLASS_CONSTANT` macro.
  class ClassConstantHandler < YARD::Handlers::C::Base
    MATCH = /\bDEFINE_RUBY_CLASS_CONSTANT\s*\(([^,]+)\s*,\s*([^,]+)\s*,\s*(\w+)\s*\)\s*;/xm
    handles MATCH
    statement_class BodyStatement

    process do
      statement.source.scan(MATCH) do |klass_name, value, const_name|
        type = "const"
        value = "nil"
        handle_constants(type, klass_name, const_name, value)
      end
    end
  end
end
