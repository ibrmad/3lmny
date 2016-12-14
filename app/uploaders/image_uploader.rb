class ImageUploader < Shrine
  plugin :determine_mime_type
end
