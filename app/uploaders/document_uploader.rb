class DocumentUploader < Shrine
  plugin :determine_mime_type
end
