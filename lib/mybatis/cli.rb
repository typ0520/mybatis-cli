# encoding: utf-8

module Mybatis
  class CLI < Thor
    class_option :help,    type: :boolean, aliases: "-h", desc: "Show this help message and quit"

    desc "generate -p package -n name table_columns", "Build po-class,mapper-class,mapper-xml (alias: 'g')."
    map ["g"] => :generate

    method_option :name,             type: :string, aliases: "-n",  :required => true, desc: "po class name"
    method_option :package,          type: :string, aliases: "-p",  default: '' , desc: "po class package name"
    method_option :mapper_package,   type: :string, aliases: "-m", default: '' , desc: "mapper class package name"
    method_option :tablename,        type: :string, aliases: "-t",  default: '' , desc: "table name"
    method_option :list,             type: :array,  aliases: "-l",  :required => true, desc: "table columns"

    def generate *args
      Mybatis.generate(*args, options)
    end

    desc "version", "Show Mybatis-CLI version number and quit (aliases: v)"
    map ["v", "-v", "--version"] => :version

    def version
      say "mybatis-command-line-tool  #{Mybatis::VERSION}"
    end
  end
end
