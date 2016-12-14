module DocumentsHelper
  def extension_type(mime_type)
    Rack::Mime::MIME_TYPES.invert[mime_type].sub(/./, '').upcase
  end
end
