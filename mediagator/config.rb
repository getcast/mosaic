Database.config('postgres://mosaic:funnyfaces@localhost/mosaic') do
	create_table?(:photos) do  # example
		primary_key :id
		String :url, null: false
		DateTime :date_added, null: false, default: Sequel::CURRENT_TIMESTAMP
	end
end

Application.config do
	pool do
		sources '"found face"'
		extractor FlickrExtractor
		repository PhotoRepository
	end
end