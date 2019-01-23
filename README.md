# EmbedView


## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'embed_view'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install embed_view
```

## TODO

- better readme with many samples
- SLIM support
- HAML support
- verify how it works with AJAX requests
- support older Rails
- show line with error in code if crash in ERB
- check regexp in code if it's good and fast
- think about better logging
- other file types support
- absolute path (using Rails.root)
- more tests (check that content from partials was rendered)
- travis.ci
- compare numbers, visualize in readme
- mention in readme links to 2 stagings + source code on heroku
- reame in samples apps with link to heroku

## Benchmarking

`wrk -t2 -c2 -d10s http://localhost:3000`

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
