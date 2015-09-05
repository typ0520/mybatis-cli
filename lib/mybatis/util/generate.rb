# encoding: utf-8
require_relative './context'

module Mybatis
  module Generate

    def generate *args, options
      context = Generate.new
      options[:package] |= ''
      #{"package"=>"package", "name"=>"Order", "tablename"=>"t_order", "list"=>["id", "order_no", "create_time"]}

    end
  end
end
