# encoding: utf-8

module Mybatis
  module MapperXMLBuilder
    public
    def build_mapper_xml(workspace,context)
      #实体类存放目录
      mapper_path = get_mapper_xml_path workspace,context

      FileUtils.makedirs mapper_path unless File.directory? mapper_path

      file_path = "#{mapper_path}#{context.po_name}Mapper.xml"
      #实体类对应文件
      file = File.new file_path ,"w"
      file.puts "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
      file.puts "<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\""
      file.puts "		\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">"
      file.puts
      mapper_folder = "#{self.get_mapper_folder context}"
      file.puts "<mapper namespace=\"#{mapper_folder}Mapper\">"
      file.puts "    <resultMap id=\"BaseResultMap\" type=\"#{self.get_class_path context}\" >"
      context.attributes.each_with_index do |attr|
        file.puts "        <result column=\"#{attr.column_name}\" property=\"#{attr.field_name}\" />"
      end
      file.puts "    </resultMap>"
      file.puts
      file.puts "   <insert id=\"insert\" parameterType=\"#{self.get_class_path context} \">"
      file.puts "     insert into #{self.get_table_name context} ("
      file.puts "       #{self.get_all_column context}"
      file.puts '     )'
      file.puts '     values('
      context.attributes.each_with_index do |attr,index|
        result = self.get_mapper_column attr.field_name
        if index != context.attributes.size - 1
          result << ','
        end
        file.puts "       #{result}"
      end
      file.puts '     )'
      file.puts '   </insert>'
      file.puts
      file.puts '   <delete id="delete">'
      file.puts "     delete from #{self.get_table_name context} where id = \#{id}"
      file.puts '   </delete>'
      file.puts
      file.puts "   <update id=\"update\" parameterType=\"#{self.get_class_path context}\">"
      file.puts "     update #{self.get_table_name context}"
      file.puts '     set'
      context.attributes.each_with_index do |attr,index|
        result = self.get_mapper_column attr.field_name
        if index != context.attributes.size - 1
          result << ','
        end
        file.puts "       #{attr.column_name} = #{result}"
      end
      file.puts "     where id = \#{id}"
      file.puts '   </update>'
      file.puts
      file.puts "   <select id=\"select\" resultType=\"#{self.get_class_path context}\" resultMap=\"BaseResultMap\">"
      file.puts "     select * from #{self.get_table_name context} where id = \#{id}"
      file.puts '   </select>'
      file.puts '</mapper>'
      file.close

      puts "create file: #{file_path}"
    end

    def get_mapper_folder(context)
      result = "#{context.po_name}"
      if context.mapper_package != ''
        result = "#{context.mapper_package}.#{context.po_name.upcase_first}" if context.mapper_package
      else
        result = "#{context.package}.#{context.po_name}" if context.package
      end
      result
    end

    def get_mapper_xml_path(workspace,context)
      mapper_path = workspace
      mapper_path << '/' unless mapper_path.end_with? '/'
      if context.mapper_package != ''
        mapper_path << context.mapper_package.gsub(/\./,'/')
      else
        mapper_path << context.package.gsub(/\./,'/') if context.package
      end
      mapper_path << '/' unless mapper_path.end_with? '/'
    end

    def get_class_path(context)
      return "#{context.package}.#{context.po_name}" if context.package
      "#{context.po_name}"
    end

    def get_table_name(context)
      "t_#{context.po_name.downcase_first.replace_upcase_to_underline}"
    end

    def get_all_column(context)
      result = ''
      context.attributes.each_with_index do |attr|
        result << ',' unless result.end_with? ','
        result << attr.column_name
      end
      result[1,result.size]
    end

    def get_mapper_column(field_name)
      result = "\#{"
      result << "#{field_name}"
      result << '}'
    end

    def get_update_values_column(context)
      result = ''
      context.attributes.each_with_index do |attr|
        result << ',\n' if result.end_with? ',\n'
        result << "#{attr.field_name} = " << '#{' << attr.field_name + '}'
      end
      result
    end
  end
end