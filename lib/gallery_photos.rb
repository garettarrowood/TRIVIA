class GalleryPhotos
  def self.for(year)
    Dir["app/assets/images/#{year}/*"].map do |file_name|
      year+"/"+file_name.split('/')[-1]
    end
  end
end
