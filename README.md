# Mybatis::Cli

根据命令行参数生成mybatis对一张表增删改查的相关文件(po类、mapper类、mapper的xml)
例如: test项目 目录结构如下
```ruby
.
├── pom.xml
└── src
    └── main
        ├── java
        └── resources
```

t_user表的增删改查

```ruby
mybatis g -p com.test.dao.po -n user -m com.test.dao --list user_id username create_time update_time
```

执行后
```ruby
.
├── pom.xml
└── src
    └── main
        ├── java
        │   └── com
        │       └── test
        │           └── dao
        │               ├── mapper
        │               │   └── UserMapper.java
        │               └── po
        │                   └── User.java
        └── resources
            └── com
                └── test
                    └── dao
                        └── mapper
                            └── UserMapper.xml
```
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mybatis-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mybatis-cli

## Usage
```ruby
mybatis g -p com.test.dao.po -n user -m com.test.dao --list user_id username create_time update_time
```

```ruby
  -n, --name=NAME                        # po class name
  -p, [--package=PACKAGE]                # po class package name
  -m, [--mapper-package=MAPPER_PACKAGE]  # mapper class package name
  -t, [--tablename=TABLENAME]            # table name
  -l, --list=one two three               # table columns
  -h, [--help], [--no-help]              # Show this help message and quit

```
Options:

## Contributing

1. Fork it ( https://github.com/typ0520/mybatis-cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
