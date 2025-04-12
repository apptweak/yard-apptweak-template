require "yard"
require "yard-apptweak-template/version"
require "yard-apptweak-template/stubs/autoload"
require "yard-apptweak-template/yard/handlers/class_constants"
require "yard-apptweak-template/yard/handlers/class_enum_constants"
require "yard-apptweak-template/yard/handlers/global_constants"
require "yard-apptweak-template/yard/html_helper"
require "yard-apptweak-template/patches/c_base_handler"

module SketchUpYARD
  def self.init
    # https://github.com/burtlo/yard-cucumber/blob/master/lib/yard-cucumber.rb
    # This registered template works for yardoc
    # YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/templates'
    # The following static paths and templates are for yard server
    # YARD::Server.register_static_path File.dirname(__FILE__) + "/templates/default/fulldoc/html"

    YARD::Templates::Engine.register_template_path templates_path

    # https://www.rubydoc.info/gems/yard/file/docs/TagsArch.md#Adding_Custom_Tags
    # https://github.com/lsegal/yard/issues/1227
    # Custom visible tags:
    tags = [
      YARD::Tags::Library.define_tag("Known Bugs", :bug)
    ]
    YARD::Tags::Library.visible_tags |= tags
  end

  def self.templates_path
    File.join(__dir__, "yard-apptweak-template", "templates")
  end
end

SketchUpYARD.init
