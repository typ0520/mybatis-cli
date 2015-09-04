require "fileutils"
require_relative "./mybatis/entity_info"

module Mybatis
  def self.start(args)
    if args.size == 0
      puts 'Bad args'
      exit 0
    end
    self.init
    entity_info = Mybatis::EntityInfo.parse_form_cli args
    entity_info.build_entity '/Users/tong/Desktop/tmp/src/main/java'
    entity_info.build_mapper_xml '/Users/tong/Desktop/tmp/src/main/resources'
    entity_info.build_mapper '/Users/tong/Desktop/tmp/src/main/java'

  end

  def self.init
    FileUtils.makedirs '/Users/tong/Desktop/tmp/src/main/java' unless File.directory? '/Users/tong/Desktop/tmp/src/main/java'
    FileUtils.makedirs '/Users/tong/Desktop/tmp/src/main/resources' unless File.directory? '/Users/tong/Desktop/tmp/src/main/resources'
  end
end
