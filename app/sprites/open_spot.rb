class OpenSpot < Joybox::Core::Sprite

  def initialize(opts={})
    @position = opts[:position]
    super file_name: 'open_spot.png', position: @position
  end

  def move(x, y)
    self.run_action Move.to position: [x, y], duration: 10
  end

  def touched?(touch_location)
    rect = CGRect.new(boundingBox.origin, boundingBox.size)
    CGRectContainsPoint(rect, touch_location)
  end

  def canBuyTower?
    true
  end

end