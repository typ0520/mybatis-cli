# encoding: utf-8

require_relative "version"
require_relative "./builder/entity_builder"
require_relative "./builder/mapper_builder"
require_relative "./builder/mapper_xml_builder"

module Mybatis
  class Attribute
    attr_accessor :name
    attr_accessor :db_field_name
    attr_accessor :type

    class << self
      def parse_for_cli(args)
        attribute = self.new
        attribute.name = args.downcase_first
        attribute.db_field_name = attribute.name.replace_upcase_to_underline
        attribute
      end
    end
  end

  class EntityInfo
    attr_accessor :package
    attr_accessor :name
    attr_accessor :attributes

    include EntityBuilder
    include MapperBuilder
    include MapperXMLBuilder

    class << self
      def parse_form_cli(args)
        puts "args: #{args}"
        #-p tong.model -n Student -t t_student -columns student_id

        for arg in args

        end

        entity_info = self.new
        # args.each_with_index do |value,index|
        #   if index == 0
        #     last_point_index = value.rindex '.'
        #     if last_point_index
        #       #有包名
        #       entity_info.package = value[0,last_point_index]
        #       entity_info.name = value[last_point_index + 1,value.size]
        #     else
        #       #无包名
        #       entity_info.name = value
        #     end
        #   else
        #     entity_info.attributes << Mybatis::Attribute::parse_for_cli(value)
        #   end
        # end
        entity_info
      end
    end

    def initialize
      self.attributes = []
    end

    def jont_package_and_name
      return "#{self.package}.#{self.name}" if self.package
      "#{self.name}"
    end
  end
end