# ClassNames

ClassNames is a simple helper to conditionally join class names together.

Influenced by: https://www.npmjs.com/package/classnames and https://github.com/nLight/css-class-string

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'class_names'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install class_names

## Usage

Inside of a view:

```html+erb
  <!-- @conditional = false -->
  <span class="<%= class_names({some: true, classy: true, [:truthy, :falsy] => @conditional} %>">
  <!-- equal to -->
  <span class="<%= class_names('some', 'classy', [:truthy, :falsy] => @conditional %>">
  <!-- => <span class="some classy falsy"></span> -->
```

```haml
  // @conditional = true
  %span{class: class_names({some: true, classy: false, [:truthy, :falsy] => @conditional})}
  // equal to
  %span{class: class_names('some', falsy: false, [:truthy, :falsy] => @conditional)}
  // => <span class="some truthy"></span>
```

Outside of a view:

```
ClassNames::Helper.new(:str_truthy => true, :str_falsy => false}).to_s
 => "str_truthy" 

ClassNames::Helper.new("truthy_1", "truthy_2").to_s
 => "truthy_1 truthy_2"

ClassNames::Helper.new({[:arr_truthy, :arr_falsy] => false}).to_s
 => "arr_falsy" 
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abodo-dev/class_names. This project is intended to be a safe, welcoming space for collaboration.