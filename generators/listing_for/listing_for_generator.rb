
class ListingForGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory("public/stylesheets/listing_for")
      m.directory("public/images/listing_for")
      m.file("ui-lightness.css", "public/stylesheets/listing_for/ui-lightness.css")
      m.file("ui-lightness.png", "public/images/listing_for/ui-lightness.png")
    end
  end
end

