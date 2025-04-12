# frozen_string_literal: true

include Helpers::ModuleHelper

def init
  find_all_apis
end

def all_objects
  run_verifier(Registry.all)
end

def find_all_apis
  apis = Set.new
  all_objects.each do |object|
    version_tag = object.tag(:api)
    apis << version_tag.text if version_tag
  end
  puts apis.sort.join("\n")
  exit # Avoid the YARD summary
end
