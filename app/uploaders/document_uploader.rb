class DocumentUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :remove_invalid

  Attacher.validate do
    validate_extension_inclusion ["docx", "pdf", "doc", "ppt", "pptx",
                                  "xls", "xlsx", "text", "txt"]
    validate_max_size 25000000
  end
end
