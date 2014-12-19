# CoercedAccessor

Provides object attribute aliases coercing values to/from human readable format

## Installation

Add this line to your application's Gemfile:

    gem 'coerced_accessor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coerced_accessor

## Human readable dates

Motivation: Rails Time.new = String can parse most date formats. On the other hand, if user inputs '12.01.2001' in text field - we should keep this value after form submission. Instead of this he will see `Time#to_s` result (`"2001-01-12 00:00:00 +0300"`).

```ruby
class UserForm
  extend CoercedAccessor::Time

  attr_accessor :birthdate
  attr_accessor :meeting_at

  time_coerced_accessor :birthdate, "%d.%m.%Y", time_class: Date
  time_coerced_accessor :meeting_at, "%d.%m.%Y %H:%M", as: :meeting_time
end

form = UserForm.new
form.birthdate_human = '12.01.2001'
form.birthdate                       # => Sat, 01 Dec 2001

form.meeting_time = '18.04.1983'
form.meeting_at                      # => Mon, 18 Apr 1983 00:00:00 +0000
```

## Multiple polymorhic entities through single attrbute

```html
<select name="imageable">
  <option value="Image:3">Image</option>
  <option value="Banner:1">Banner</option>
  ...
</select>
```

```ruby
class User < ActiveRecord::Base
  extend CoercedAccessor::Compound

  belongs_to :imageable
  compound_accessor :imageable_formatted, :imageable_id, :imageable_type, delimiter: ':'
end

user = User.new
user.imageable_formatted = "Image:3"
user.imageable_id                     # => 3
user.imageable_type                   # => "Image"
```

## Single joined attribute through partial accessors

```ruby
class TimeForm
  extend CoercedAccessor::Compound

  attr_accessor :time

  compound_accessor :time, :hour, :minute, delimiter: ':'
end

tree = TimeForm.new
tree.hour   = '03'
tree.minute = '50'
tree.path                            # => '03:50'
```

## Contributing

1. Fork it ( https://github.com/gzigzigzeo/coerced_accessor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
