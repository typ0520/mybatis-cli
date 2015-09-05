# encoding: utf-8

module Mybatis
  module Generate
    class Attribute
      attr_accessor :field_name
      attr_accessor :column_name
      attr_accessor :type

      class << self
        def instance_with_options str
          attribute = self.new
          attribute.field_name = str.replace_underline_upcase_to.downcase_first
          attribute.column_name = str
          attribute
        end
      end
    end

    class GenerateContext
      attr_accessor :package
      attr_accessor :po_name
      attr_accessor :table_name
      attr_accessor :attributes

      class << self
        def instance_with_options options
          #{"package"=>"package", "name"=>"Order", "tablename"=>"t_order", "list"=>["id", "order_no", "create_time"]}
          context = self.new
          context.package = options[:package]
          context.po_name = options[:name].upcase_first
          context.table_name =
              options[:tablename] != '' ? options[:tablename] : "t#{context.po_name.replace_upcase_to_underline}"
          for str in options[:list]
            attr = Mybatis::Generate::Attribute.instance_with_options str
            context.attributes << attr
          end
          context
        end
      end

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