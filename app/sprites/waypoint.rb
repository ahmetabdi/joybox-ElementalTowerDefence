class Waypoint < Joybox::Core::Sprite

  def initialize(opts={})
    @position = opts[:location]
    @next_way_point = opts[:next_way_point]
    super file_name: 'Untitled.png', position: @position
  end

  def draw
    super.tap do
      ccDrawColor4B(0, 255, 2, 255)
      ccDrawCircle([0,0], 6, 360, 30, false)
      ccDrawCircle([0,0], 2, 360, 30, false)

      if(@next_way_point)
        ccDrawLine([0,0], @next_way_point.myPosition)
      end
    end
  end

end
