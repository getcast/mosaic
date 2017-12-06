class PhotosRepository < Hanami::Repository
	self.relation = :photos

	mapping do
		attribute :id, from: :id
		attribute :url, from: :url
		attribute :date_added, from: :date_added
	end	

	def take(limit)
		photos.order{date_added.desc}.limit(limit)
	end	
end
