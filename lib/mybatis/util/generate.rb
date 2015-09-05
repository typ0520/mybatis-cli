# encoding: utf-8

require_relative 'context'
require_relative 'folder'
require_relative '../builder/builder'

module Mybatis
  module Generate

    include Mybatis::Folder
    include Mybatis::Builder

    def generate *args, options
      p options
      context = Mybatis::Generate::GenerateContext.instance_with_options options

      for folder in [self.get_source_folder,self.get_resources_folder]
        next if File.directory? folder
        puts "Warning. not found #{folder}"
        self.confirm_options 'Are you sure create folder (y/n)?' do |result|
          exit 0 unless result
          FileUtils.makedirs folder
        end
      end

      Mybatis::Builder.build_po self.get_source_folder,context
      Mybatis::Builder.build_mapper_xml self.get_resources_folder,context
      # build_mapper_xml context
    end
  end
end
