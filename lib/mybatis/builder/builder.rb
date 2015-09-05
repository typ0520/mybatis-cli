# encoding: utf-8

require_relative 'po_builder'
require_relative 'mapper_builder'
require_relative 'mapper_xml_builder'

module Mybatis
  module Builder
    class << self
      include Mybatis::PoBuilder
      include Mybatis::MapperBuilder
      include Mybatis::MapperXMLBuilder
    end
  end
end