# encoding: utf-8

require "fileutils"
require_relative "../util/string_ext"

module Mybatis
  module EntityBuilder
    public
    def build_entity(workspace)
      raise ArgumentError, "No such dicrecoty - #{workspace}" unless File.directory? workspace

      #实体类存放目录
      entity_path = get_entity_path workspace

      puts "entity_path #{entity_path}"
      FileUtils.makedirs entity_path unless File.directory? entity_path

      file_path = "#{entity_path}#{self.name}.java"
      #实体类对应文件
      file = File.new file_path ,"w"
      file.puts "package #{self.package};" if self.package
      file.puts
      file.puts "/**"
      file.puts " * Created by mybatis-cli"
      file.puts " */"
      file.puts "public class #{self.name} {"

      self.attributes.each_with_index do |attr|
        file.puts "    private String #{attr.name};"
        file.puts
      end

      self.attributes.each_with_index do |attr|
        file.puts "    public String get#{attr.name}() {"
        file.puts "        return this.#{attr.name};"
        file.puts "    }"
        file.puts
      end
      self.attributes.each_with_index do |attr|
        file.puts "    public void set#{attr.name.upcase_first}(String #{attr.name}) {"
        file.puts "        this.#{attr.name} = #{attr.name};"
        file.puts "    }"
        file.puts
      end
      file.puts "}"
      file.close

      puts "create file: #{file_path}"
    end

    private
    def get_entity_path(workspace)
      entity_path = workspace
      entity_path << '/' unless entity_path.end_with? '/'
      entity_path << self.package.gsub(/\./,'/') if self.package
      entity_path << '/' unless entity_path.end_with? '/'
    end
  end
end