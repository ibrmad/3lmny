class DocumentUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type_inclusion %w[application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document
 application/vnd.ms-powerpointtd> application/vnd.openxmlformats-officedocument.presentationml.presentation application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]
  end
end
