class CustomSprite < CCSprite

  def touched?(touch_location)
    touch_location.x > boundingBox.origin.x &&
    touch_location.x < (boundingBox.origin.x + boundingBox.size.width) &&
    touch_location.y > boundingBox.origin.y &&
    touch_location.y < (boundingBox.origin.y + boundingBox.size.height)
  end

  def canBuyTower?
    true
  end

end