module ApplicationHelper
  include Pagy::Frontend

  # Display image with flexible chain method
  # @method_chain: avatar.thumb.url, avatar.thumb
  def image_for(object, method_chain, opts = {})
    image_default = 'no_image_100x70.png'
    method_chain  = method_chain.to_s
    img           = method_chain.to_s.split('.').inject(object, :send) rescue nil
    return image_tag(image_default, opts) if img.blank?
    return image_tag(img, opts) if method_chain.include? '.url'
    image_tag(img.url, opts)
  end

  def image_preview(path = '', opts = {})
    image_default = 'no_image_100x70.png'
    id            = opts[:id].presence || 'js-preview-image'
    klass         = 'img-thumbnail max-height-310 ' + opts[:class].to_s
    opts          = opts.merge(id: id, class: klass)
    image_tag(path.presence || image_default, opts)
  end

  def pretty_duration(duration)
    Time.at(duration.to_i).in_time_zone.strftime('%H:%M:%S')
  end

  def uuid_machine
    uuid = `system_profiler SPHardwareDataType | awk '/UUID/ { print $3; }'`
    uuid.delete("\n")
  end

  def data_chart_pie(options)
    args = %i(label number bgcolor hover_bgcolor)
    raise ArgumentError, "missing arguments :#{args.join(', :')}" unless options.keys == args

    "#{options[:label]}:#{options[:number]}:#{options[:bgcolor]}:#{options[:hover_bgcolor]}"
  end
end
