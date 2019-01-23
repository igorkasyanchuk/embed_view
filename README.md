# EmbedView

Improve application performance by 5-20% (depending on your logic, views and layouts) without major code changes.

Rails have slow rendering, expecially when you have view and many partials included inside.

This gem simply embeds views into another views. Works similar to partials, but instead of rendering main view, partials - it's creates a bigger view with content from partials and renders all together.

So if you have a pretty stable app, rarely changed ERB views(_header, _footer, _ga, _etc...) you can embed them in main view/layout and render together.

Such small tweak could give 5-20% boost for performance.

## Usage

Currently works only with ERB templates.

Instead of:

```
  <%= render '/shared/header' %>
```

just write:

```
  <%= embed_view "../shared/_header.html.erb" %>
```

Please note that this is not a typical helper. This is just a meta tag which will be replaced with content from file.

There are no familiar "locals", "collection", etc things from "partial". 

During development just follow the rule that content from embedded file is inside this file. So all variables available before `embed_view` will be available in inserted file.

Path to file must be relative to file where it's embeds.

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

## Sample

Sample of rendering from dummy app: https://github.com/igorkasyanchuk/embed_view/tree/master/test/dummy/app/views

```
Processing by UsersController#show as HTML
  Parameters: {"id"=>"6"}
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 6], ["LIMIT", 1]]
  ↳ app/controllers/users_controller.rb:51
  embed_view: ../shared/_header.html.erb
  embed_view: ../shared/_footer.html.erb
  embed_view: _ga.html.erb
  Rendering users/show.html.erb within layouts/application
  Rendered users/show.html.erb within layouts/application (0.9ms)
   (0.1ms)  SELECT COUNT(*) FROM "users"
  ↳ app/views/layouts/application.html.erb:20
  User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY random() LIMIT ?  [["LIMIT", 5]]
  ↳ app/views/layouts/application.html.erb:428
Completed 200 OK in 38ms (Views: 34.9ms | ActiveRecord: 0.5ms)
```

## Known issues & limitations

- support only ERB
- if you have an issue in code in embedded file you won't see correct line with error
- not tested with older Rails (only with Rails 5.2)

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
- compare numbers(benchmark), visualize in readme
- mention in readme links to 2 stagings + source code on heroku
- reame in samples apps with link to heroku

## Benchmarking

`wrk -t2 -c2 -d10s http://localhost:3000`

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
