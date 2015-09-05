# encoding: utf-8

require "fileutils"
require_relative "./mybatis/entity_info"
require_relative "./mybatis/cli"
require_relative "../lib/mybatis/util/generate"

module Mybatis
  class << self
    include Generate
  end
end

