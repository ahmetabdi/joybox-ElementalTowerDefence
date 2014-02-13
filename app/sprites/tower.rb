class Tower < Joybox::Core::Sprite

  def initialize(opts={})
    @position = opts[:position]
    @attack_range = 50
    @damage = 10
    @fire_rate = 1.0
    super file_name: 'tower.png', position: @position
  end

  def draw
    super.tap do
      ccDrawColor4B(255, 0, 0, 255)
      ccDrawCircle([21,21], @attack_range, 360, 30, true)
    end
  end

end
