# encoding: utf-8

module Mybatis
  module Generate
    class Attribute
      attr_accessor :field_name
      attr_accessor :column_name
      attr_accessor :type

      class << self
        def parse_from_cli(args)
          attribute = self.new
          attribute.name = args.downcase_first
          attribute.db_field_name = attribute.name.replace_upcase_to_underline
          attribute
        end
      end
    end

    class GenerateContext
      attr_accessor :package
      attr_accessor :po_name
      attr_accessor :table_name
      attr_accessor :attributes

      def initialize
        self.package = ''
        self.attributes = []
      end

      def jont_package_and_po_name
        return "#{self.package}.#{self.po_name}" if self.package
        "#{self.po_name}"
      end
    end
  end
end