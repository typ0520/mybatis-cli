require_relative "./util/string_ext"

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
end
