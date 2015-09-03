class String
  def upcase_first
    str = "#{self}"
    "#{str[0].upcase}#{str[1,str.size]}"
  end

  def downcase_first
    str = "#{self}"
    "#{str[0].downcase}#{str[1,str.size]}"
  end

  #OrderNo => order_no
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
end