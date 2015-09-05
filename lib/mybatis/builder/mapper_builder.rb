# encoding: utf-8

require "fileutils"
require_relative "../util/string_ext"

module Mybatis
  module MapperBuilder
    public
    def build_mapper(workspace)
      raise ArgumentError, "No such dicrecoty - #{workspace}" unless File.directory? workspace

      #实体类存放目录
      mapper_path = get_mapper_path workspace

      FileUtils.makedirs mapper_path unless File.directory? mapper_path

      file_path = "#{mapper_path}#{self.name}Mapper.java"
      #实体类对应文件
      file = File.new file_path ,"w"
      file.puts "package #{self.package}.mapper;" if self.package
      file.puts
      file.puts "import #{self.jont_package_and_name};"
      file.puts
      file.puts "/**"
      file.puts " * Created by mybatis-cli"
      file.puts " */"
      file.puts "public interface #{self.name}Mapper {"
      file.puts "      void insert(#{self.name} #{self.name.downcase_first});"
      file.puts
      file.puts "      void delete(int id);"
      file.puts
      file.puts "      void update(#{self.name} #{self.name.downcase_first});"
      file.puts
      file.puts "      #{self.name} select(int id);"
      file.puts
      file.puts "}"
      file.close

      puts "create file: #{file_path}"
    end

    private
    def get_mapper_path(workspace)
      mapper_path = workspace
      mapper_path << '/' unless mapper_path.end_with? '/'
      mapper_path << self.package.gsub(/\./,'/') if self.package
      mapper_path << '/' unless mapper_path.end_with? '/'
      mapper_path << 'mapper/'
    end
  end
end