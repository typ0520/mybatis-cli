# encoding: utf-8

module Mybatis
  class Context
    attr_accessor :launch_dir

    class << self
      def confirm_options(description)
        result = ''
        until result == 'y' || result == 'n'
          puts description
          result = gets.sub /[\s]/,''
        end
        yield result == 'y' ? true : false
      end
    end
  end
end

