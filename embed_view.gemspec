$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "embed_view/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "embed_view"
  spec.version     = EmbedView::VERSION
  spec.authors     = ["Igor Kasyanchuk"]
  spec.email       = ["igorkasyanchuk@gmail.com"]
  spec.homepage    = "http://github.com/igorkasyanchuk/embed_view"
  spec.summary     = "Embed partial inline into your views to increase performance of rendering."
  spec.description = "Embed partial inline into your views to increase performance of rendering."
  spec.license     = "MIT"
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.add_dependency "rails", "~> 5.2.2"
  spec.add_development_dependency "sqlite3"

  spec.add_development_dependency 'minitest-rails'
  spec.add_development_dependency 'minitest-rails-capybara'
  spec.add_development_dependency 'capybara'  
end
