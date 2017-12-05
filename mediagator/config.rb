Database.config \
	adapter: :postgres, \
	user: 'mosaic', \
	password: 'funnyfaces', \
	host: 'localhost', \
	database: 'mosaic' \
do
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
		wait_time 1
	end
end