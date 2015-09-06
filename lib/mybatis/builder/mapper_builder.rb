# encoding: utf-8

module Mybatis
  module MapperBuilder
    public
    def build_mapper(workspace,context)
      #实体类存放目录
      mapper_path = get_mapper_path workspace,context

      FileUtils.makedirs mapper_path unless File.directory? mapper_path

      file_path = "#{mapper_path}#{context.po_name}Mapper.java"
      #实体类对应文件
      file = File.new file_path ,"w"
      if context.mapper_package != ''
        file.puts "package #{context.mapper_package};"
      else
        file.puts "package #{context.package}.mapper;" if context.package
      end
      file.puts
      file.puts "import #{context.join_package_and_po_name};"
      file.puts
      file.puts "/**"
      file.puts " * Created by mybatis-cli"
      file.puts " */"
      file.puts "public interface #{context.po_name}Mapper {"
      file.puts "      void insert(#{context.po_name} #{context.po_name.downcase_first});"
      file.puts
      file.puts "      void delete(int id);"
      file.puts
      file.puts "      void update(#{context.po_name} #{context.po_name.downcase_first});"
      file.puts
      file.puts "      #{context.po_name} select(int id);"
      file.puts
      file.puts "}"
      file.close

      puts "create file: #{file_path}"
    end

    private
    def get_mapper_path(workspace,context)
      mapper_path = workspace
      mapper_path << '/' unless mapper_path.end_with? '/'
      if context.mapper_package != ''
        mapper_path << context.mapper_package.gsub(/\./,'/')
      else
        mapper_path << context.package.gsub(/\./,'/') if context.package
        mapper_path << 'mapper'
      end
      mapper_path << '/' unless mapper_path.end_with? '/'
    end
  end
end