class DocumentUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type_inclusion %w[application/msword application/pdf application/vnd.ms-powerpointtd>
                                   application/vnd.openxmlformats-officedocument.presentationml.presentation
                                   application/vnd.openxmlformats-officedocument.wordprocessingml.document]
    validate_max_size 1000000
  end
end
