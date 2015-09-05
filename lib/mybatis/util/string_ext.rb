# encoding: utf-8

module Mybatis
  class String
    #首字母变大写
    def upcase_first
      str = "#{self}"
      "#{str[0].upcase}#{str[1,str.size]}"
    end

    #首字母变小写
    def downcase_first
      str = "#{self}"
      "#{str[0].downcase}#{str[1,str.size]}"
    end

    #把大写字母转换成 OrderNo => order_no
    def replace_upcase_to_underline
      str = ''
      self.each_char do |ch|
        if /[A-Z]/ =~ ch
          str << "_#{ch.downcase}"
        else
          str << ch
        end
      end
      str
    end

    #order_no => OrderNo
    def replace_underline_upcase_to
      str = ''
      self.each_char do |ch|
        if /[A-Z]/ =~ ch
          str << "_#{ch.downcase}"
        else
          str << ch
        end
      end
      str
    end
  end
end