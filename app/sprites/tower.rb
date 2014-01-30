class Tower < Joybox::Core::Sprite

  def initialize(opts={})
    @position = opts[:position]
    @attack_range = 70
    @damage = 10
    @fire_rate = 1.0
    super file_name: 'tower.png', position: @position
  end

end
