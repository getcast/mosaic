module Web::Controllers::Mosaic
  class Show
    include Web::Action

    expose :photos

    def call(params)
        repository = PhotosRepository.new
        @photos = repository.take(200)
    end
  end
end
