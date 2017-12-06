require 'flickr_fu'

class FlickrExtractor < Extractor
	def initialize
		path = File.dirname(__FILE__)
		@flickr = Flickr.new(path + '/flickr.yml')
		@photos = PhotoRepository.new.photos
	end

	def verify(tag)
		return true unless @photos.count > 0
		
		photos = @flickr.photos.search(:text => tag, 
			:min_upload_date => @photos.max{date_added})
		
		photos.size > 0
	end

	def extract(text)
		return extract_with(text: text) if @photos.count == 0
    
    extract_with(text: text, min_upload_date: @photos.max{date_added} + Rational(1, 86400))
	end

	def extract_with(text:, **options)
		photos = @flickr.photos.search(:text => text, 
			:per_page => 500, **options)
		new_pages = photos.pages

		new_photos = []
		new_pages.times do |page|
			photos = @flickr.photos.search(:text => text, 
				:per_page => 500, :page => page+1, **options)

			photos.each do |photo|
				n = {}
				n[:url] = photo.url(:medium)
				n[:date_added] = photo.uploaded_at
				new_photos << n
		  end
		end

		new_photos
	end
end
