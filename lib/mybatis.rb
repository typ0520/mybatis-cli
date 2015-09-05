# encoding: utf-8

require 'thor'
require 'fileutils'
require_relative './mybatis/version'
require_relative './mybatis/cli'
require_relative './mybatis/util/generate'
require_relative '../lib/mybatis/util/string_ext'

module Mybatis
  class << self
    include Mybatis::Generate

    def launch_dir
      Dir.pwd
    end

    def confirm_options(description)
      result = ''
      until result == 'y' || result == 'n'
        puts description
        result = $stdin.gets.sub /[\s]/,''
      end
      yield result == 'y' ? true : false
    end
  end
end

