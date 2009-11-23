class ListingForSource
  
  attr_accessor :columns
  
  def initialize
    @columns = []
  end
  
  def add(header, options={}, &block)
    if options[:align]
      options[:class] = (options[:class] || "")+" "+options[:align].to_s 
      options.delete(:align)
    end
    @columns << { :header => header, :options => options, :block => block }
  end
  
end

module ListingForHelper
  
  def listing_for(caption, records, options={})
    
    lfs = ListingForSource.new
    
    yield(lfs)
    
    concat(
      content_tag(
        :div,
        content_tag(
          :table,
          content_tag(
            :caption,
            caption
          )+
          content_tag(
            :thead,
            content_tag(
              :tr,
              lfs.columns.map do |column|
                content_tag(:th, column[:header])
              end.join
            )
          )+    
          content_tag(
            :tbody, 
            records.map do |record|
              content_tag(
                :tr,
                lfs.columns.map do |column|
                  content_tag(
                    :td,
                    capture(record, &column[:block]),
                    column[:options]
                  )
                end.join,
                { :class => cycle("row-odd", "row-even") }
              )
            end
          )
        )+
        (options ? (options[:will_paginate] ? will_paginate(records) : "") : ""),
        :class => "listing"
      )
    )
    
  end
  
end
