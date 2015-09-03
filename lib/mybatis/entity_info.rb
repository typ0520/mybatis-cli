require_relative "version"
require_relative "attribute"
require_relative "./builder/entity_builder"
require_relative "./builder/mapper_builder"

module Mybatis
  class EntityInfo
    attr_accessor :package
    attr_accessor :name
    attr_accessor :attributes

    include EntityBuilder
    include MapperBuilder

    class << self
      def parse_form_cli(args)
        entity_info = self.new
        args.each_with_index do |value,index|
          if index == 0
            last_point_index = value.rindex '.'
            if last_point_index
              #有包名
              entity_info.package = value[0,last_point_index]
              entity_info.name = value[last_point_index + 1,value.size]
            else
              #无包名
              entity_info.name = value
            end
          else
            entity_info.attributes << Mybatis::Attribute::parse_for_cli(value)
          end
        end
        entity_info
      end
    end

    def initialize
      self.attributes = []
    end
  end
end