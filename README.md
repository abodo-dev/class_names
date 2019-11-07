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
  <span class="<%= class_names('foo', 'bar') %>">
  <!-- => <span class="foo bar"></span> -->
  
  <span class="<%= class_names('foo', { bar: true }) %>">
  <!-- => <span class="foo bar"></span> -->
  
  <span class="<%= class_names('foo-bar': true) %>">
  <!-- => <span class="foo-bar"></span> -->
  
  <span class="<%= class_names('foo-bar': false) %>">
  <!-- => <span class=""></span> -->
  
  <span class="<%= class_names(foo: true, bar: true) %>">
  <!-- => <span class="foo bar"></span> -->
  
  <span class="<%= class_names({ foo: true, bar: true }) %>">
  <!-- => <span class="foo bar"></span> -->
  
  <!-- Simple ternary replacement with multiple hashes !-->
  <span class="<%= class_names([:truthy, :falsy] => true) %>">
  <!-- => <span class="truthy"></span> -->
  
  <span class="<%= class_names([:truthy, :falsy] => false) %>">
  <!-- => <span class="falsy"></span> -->
  
  <!-- Lots of different types of arguments -->
  <span class="<%= class_names(some: true, classy: true, [:truthy, :falsy] => false, 'foo') %>">
  <!-- equal to -->
  <span class="<%= class_names('some', 'classy', [:truthy, :falsy] => false %>, 'foo')">
  <!-- => <span class="some classy falsy foo"></span> -->
```

```haml
  %span{class: class_names(some: true, classy: false, [:truthy, :falsy] => true)}
  // equal to
  %span{class: class_names('some', falsy: false, [:truthy, :falsy] => true)}
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

## Performance
On 50,000 calls. The unit of time is seconds.

|                                  | user     | system   | total    | real        |
|----------------------------------|----------|----------|----------|-------------|
| With 1 array and 1 string value  | 0.660000 | 0.000000 | 0.660000 | (0.657901)  |
| With 5 array and 5 string values | 0.640000 | 0.000000 | 0.640000 | (0.650673)  |
| With 10 array values             | 0.450000 | 0.000000 | 0.450000 | (0.449735)  |
| With 10 string values            | 0.320000 | 0.010000 | 0.330000 | (0.320911)  |
