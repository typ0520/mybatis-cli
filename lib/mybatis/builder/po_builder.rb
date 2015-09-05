# encoding: utf-8

module Mybatis
  module PoBuilder
    def build_po(workspace,context)
      #实体类存放目录
      entity_path = get_po_folder workspace,context
      FileUtils.makedirs entity_path unless File.directory? entity_path

      file_path = "#{entity_path}#{context.po_name}.java"
      #实体类对应文件
      file = File.new file_path ,"w"
      file.puts "package #{context.package};" if context.package
      file.puts
      file.puts "/**"
      file.puts " * Created by mybatis-cli"
      file.puts " */"
      file.puts "public class #{context.po_name} {"

      context.attributes.each_with_index do |attr|
        file.puts "    private String #{attr.field_name};"
        file.puts
      end

      context.attributes.each_with_index do |attr|
        file.puts "    public String get#{attr.field_name.upcase_first}() {"
        file.puts "        return this.#{attr.field_name};"
        file.puts "    }"
        file.puts
      end
      context.attributes.each_with_index do |attr|
        file.puts "    public void set#{attr.field_name.upcase_first}(String #{attr.field_name}) {"
        file.puts "        this.#{attr.field_name} = #{attr.field_name};"
        file.puts "    }"
        file.puts
      end
      file.puts "}"
      file.close

      puts "create file: #{file_path}"
    end

    private
    def get_po_folder(workspace,context)
      entity_path = workspace
      entity_path << '/' unless entity_path.end_with? '/'
      entity_path << context.package.gsub(/\./,'/') if context.package
      entity_path << '/' unless entity_path.end_with? '/'
    end
  end
end