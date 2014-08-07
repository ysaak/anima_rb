module EntitiesHelper

  def thumb_img_tag(entity_id)

    path = "/thumbs/#{entity_id}.jpg"

    t = Rails.root.join('public', 'thumbs', "#{entity_id}.jpg")

    if not FileTest.exist?(t)
      path = 'no_image.svg'
    end

    image_tag path, width: 60, height: 60
  end

  def picture_img_tag(entity_id)

    path = "/pics/#{entity_id}.jpg"

    t = Rails.root.join('public', 'pics', "#{entity_id}.jpg")

    if FileTest.exist?(t)
      image_tag path, width: '100%', class: 'img-rounded'
    else
      image_tag 'no_image.svg', width: '100%', height: 150, class: 'img-rounded'
    end
  end
end
