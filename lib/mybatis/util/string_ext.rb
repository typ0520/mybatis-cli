# encoding: utf-8


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

  #把大写字母转换成小写字母并在前面加下划线 MybatisCli => mybatis_cli
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

  #去掉下划线并把后一个字母转换成大写  mybatis_cli => MybatisCli
  def replace_underline_upcase_to
    str = ''
    next_to_downcase = false
    self.each_char do |ch|
      if next_to_downcase
        str << ch.upcase
        next_to_downcase = false
        next;
      end
      str << ch unless next_to_downcase = (ch == '_')
    end
    str
  end
end
