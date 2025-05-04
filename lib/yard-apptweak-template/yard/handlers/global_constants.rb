# frozen_string_literal: true

module ApptweakTemplateYARD
  # Handles the definition of global constants defined in the Ruby code using
  # the `DEFINE_RUBY_CONSTANT` macro or `rb_define_global_const`.
  class GlobalConstantHandler < YARD::Handlers::C::Base
    MATCH = /\bDEFINE_RUBY_(?:(?:NAMED_)?CONSTANT|ENUM)\s*\((?:[^)]+,\s*)?(\w+)\)\s*;/xm
    handles MATCH
    statement_class BodyStatement

    process do
      statement.source.scan(MATCH) do |captures|
        const_name = captures.first
        type = "global_const"
        var_name = nil
        value = "nil"
        handle_constants(type, var_name, const_name, value)
      end
    end
  end
end
