file = File.read("data/pages.json")
ar = JSON.parse(file)

ar.each do |title|
  proxy "/works/#{title['id']}.html", "/works/template.html", 
  :locals => { 
    :title   => title['title'], 
    :name   => title['name'], 
    :description => title['description'],
    :content => title['content'],
    :url => title['url']
  }
end

file2 = File.read("data/services.json")
ar2 = JSON.parse(file2)

ar2.each do |title|
  proxy "/services/#{title['id']}.html", "/services/template.html", 
  :locals => { 
    :title   => title['title'],
    :link   => title['link'],
    :content   => title['content'],
    :slug   => title['slug']
  }
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :directory_indexes
###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
