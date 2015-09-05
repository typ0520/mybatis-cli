# encoding: utf-8

module Mybatis
  module Folder
    def get_source_folder
      folder = "#{Mybatis.launch_dir}/src/main/java"

      folder
    end

    def get_resources_folder
      folder = "#{Mybatis.launch_dir}/src/main/resources"

      folder
    end

    def get_test_source_folder
      Mybatis.launch_dir << "/src/test/java/"
    end

    def get_test_resources_folder
      Mybatis.launch_dir << "/src/test/resources/"
    end
  end
end