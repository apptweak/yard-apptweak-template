# frozen_string_literal: true

include Helpers::ModuleHelper

MANIFEST_FILENAME = "coverage.manifest"

def init
  list_all_classes
end

def all_objects
  run_verifier(Registry.all)
end

def class_objects
  run_verifier(Registry.all(:class))
end

def namespace_definition(object)
  return if object.root?

  definition = "#{object.type} #{object.path}"
  definition << " < #{object.superclass.path}" if object.type == :class && object.superclass.name != :Object
  output = StringIO.new
  # output.puts generate_docstring(object)
  output.puts definition
  output.string
end

def generate_mixins(object, scope)
  output = StringIO.new
  mixin_type = scope == :class ? "extend" : "include"
  mixins = run_verifier(object.mixins(scope))
  mixins = stable_sort_by(mixins, &:path)
  mixins.each do |mixin|
    output.puts "  #{mixin_type} #{mixin.path}"
  end
  output.string
end

def list_all_classes
  # versions = Set.new
  klasses = class_objects.map do |object|
    # version_tag = object.tag(:version)
    # versions << version_tag.text if version_tag
    namespace_definition(object)
  end
  # puts klasses.sort.join("\n")
  puts klasses.sort.join
  exit # Avoid the YARD summary
end
