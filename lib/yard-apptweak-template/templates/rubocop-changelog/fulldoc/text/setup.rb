require "fileutils"
require "set"
require "stringio"

include Helpers::ModuleHelper

def init
  generate_changelog
end

def all_objects
  run_verifier(Registry.all)
end

def namespace_objects
  run_verifier(Registry.all(:class, :module))
end

def changelog_filename
  "Changelog SU201x.log"
end

VERSION_MATCH = /^\D+([0-9.]+)(?:\s+M(\d+))?$/

def generate_changelog
  output = StringIO.new

  versions = {}
  all_objects.each do |object|
    version_tag = object.tag(:version)
    next if version_tag.nil?

    version = version_tag.text

    # Don't list SU6 or older.
    result = version.match(VERSION_MATCH)
    next if result && result.captures[0].to_i <= 6

    if result.nil?
      warn "WARNING: Invalid version format: #{version} (#{object.path})"
      next
    end

    versions[version] ||= {}
    versions[version][object.type] ||= []
    versions[version][object.type] << object.path
  end
  versions = versions.sort do |a, b|
    v1, mv1 = a[0].match(VERSION_MATCH).captures
    v2, mv2 = b[0].match(VERSION_MATCH).captures
    if v1 == v2
      (mv2 || "0").to_i <=> (mv1 || "0").to_i
    else
      v2.to_f <=> v1.to_f
    end
  end

  output.puts "FEATURES = ["
  versions.each do |version, features|
    output.puts ""
    output.puts "  {"
    output.puts "    version: '#{version}',"
    output.puts "    types: {"
    features.sort.each do |type, objects|
      next if objects.empty?

      output.puts "      #{type}: ["
      objects.sort.each do |object|
        output.puts "        '#{object}',"
      end
      output.puts "      ],"
    end
    output.puts "    },"
    output.puts "  },"
  end
  output.puts "]"

  puts output.string
  exit # Avoid the YARD summary
end
