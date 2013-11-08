class BasicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  storage :file

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/assets/default_image.gif"
  end

def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :avatar do
    process resize_to_fill: [50, 50]
  end

  version :small_square do
    process resize_to_fill: [500, 500]
  end

  version :small_full do
    process resize_to_fit: [500, 500]
  end

  version :large_square do
    process resize_to_fill: [900, 900]
  end

  version :large_full do
    process resize_to_fit: [900, 900]
  end
end