# # encoding: utf-8
#
# require "fileutils"
# require_relative "./mybatis/entity_info"
#
# module Mybatis
#   class << self
#     def start(args)
#       if args.size == 0
#         args = ['help'];
#       end
#
#       case args[0]
#         when 'generate','g'
#           self.do_generate args[1,args.size]
#         when 'rollback','r'
#           self.do_rollback args[1,args.size]
#         when 'help','h'
#           self.do_help
#         else
#           puts "mybatis: '#{args[0]}' is not a mybatis command. See 'mybatis help'."
#           exit 0
#       end
#     end
#
#     def do_generate(args)
#       source_folder = "#{Dir.pwd}/src/main/java"
#       resource_folder = "#{Dir.pwd}/src/main/resources"
#       for folder in [source_folder,resource_folder]
#         next if File.directory? folder
#         puts "Warning. not found #{folder}"
#         self.confirm_options 'Are you sure create folder (y/n)?' do |result|
#           exit 0 unless result
#           FileUtils.makedirs folder
#         end
#       end
#       entity_info = Mybatis::EntityInfo.parse_form_cli args
#       # entity_info.build_entity source_folder
#       # entity_info.build_mapper source_folder
#       # entity_info.build_mapper_xml resource_folder
#     end
#
#     def do_rollback(args)
#
#     end
#
#     def do_help
#       puts "The most commonly used mybatis commands are: "
#       puts "  generate  Generate mybatis po files、 xml files 、 mapper class"
#       puts "  rollback  Rollback last generated"
#       puts
#       puts "'mybatis help' and 'mybatis h' list available subcommands"
#     end
#
#     def confirm_options(description)
#       result = ''
#       until result == 'y' || result == 'n'
#         puts description
#         result = $stdin.gets.chomp()
#       end
#       yield result == 'y' ? true : false
#     end
#   end
#   # def self.init
#   #   FileUtils.makedirs '/Users/tong/Desktop/tmp/src/main/java' unless File.directory? '/Users/tong/Desktop/tmp/src/main/java'
#   #   FileUtils.makedirs '/Users/tong/Desktop/tmp/src/main/resources' unless File.directory? '/Users/tong/Desktop/tmp/src/main/resources'
#   # end
# end
#
# # Mybatis::confirm_options 'are you sure?' do |result|
# #   puts "re: #{result}"
# # end
