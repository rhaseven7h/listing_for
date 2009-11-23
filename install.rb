puts <<-EOT

  ListingFor Rails Plug-in has been installed, now run
  the generator to place the themes files in public
  stylesheets directory:

  script/generator listing_for

  Then just include your favorite theme in your layout file:
  
  <%= stylesheet_link_tag "listing_for/ui-lightness", :media => "screen, projection" %>
  
  And that's it. you're ready to go.
  
EOT


