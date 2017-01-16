class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :remove_invalid

  Attacher.validate do
    validate_extension_inclusion [/jpe?g/, "png"]
    validate_mime_type_inclusion ["image/jpeg", "image/png", 'image/jpg']
    validate_max_size 5242880
  end
end
