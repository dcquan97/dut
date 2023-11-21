require 'carrierwave/orm/activerecord'

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME'] || 'dcqbean'
  config.api_key = ENV['CLOUD_API_KEY'] || '251127759461936'
  config.api_secret = ENV['CLOUD_API_SECRET_KEY'] || 'CEHW5Ugu1dfevM7qxnToJV1Is-o'
  config.secure = true
  config.cdn_subdomain = true
  config.enhance_image_tag = true
  config.static_file_support = true
end

CarrierWave.configure do |config|
  config.cache_storage = :file
  config.storage = :file
end