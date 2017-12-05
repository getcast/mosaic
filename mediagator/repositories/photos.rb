class PhotoRepository < Repository
	attr_reader :photos

	def initialize
		@photos = Database[:photos]
	end

	def batch_update(new_photos) 
		new_photos.each do |photo|
			@photos.insert(photo)
		end
		puts "inserted!"
	end
end