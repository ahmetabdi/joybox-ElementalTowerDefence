class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    background = Sprite.new file_name: 'bg.png', position: Screen.center
    self << background

    loadTowerPositions
    addWayPoints

    on_touches_began do |touches, event|
      touch = touches.any_object
      if base = towerBases.detect { |t| t.touched?(touch.location) }
        if base.canBuyTower?
          tower = Tower.new(position: base.position)
          self << tower
          towers.addObject(tower)
        end
      end
    end

  end

  def addWayPoints
    waypoints << Waypoint.new( location: [ 420, 35 ] )
    waypoints << Waypoint.new( location: [ 35,  35 ] )
    waypoints << Waypoint.new( location: [ 35, 130 ] )
    waypoints << Waypoint.new( location: [ 445,130 ] )
    waypoints << Waypoint.new( location: [ 445,220 ] )
    waypoints << Waypoint.new( location: [ -40,220 ] )

    waypoints.each do |w|
      self << w
    end
  end

  def loadTowerPositions
    @plistPath = NSBundle.mainBundle.pathForResource("common/TowersPosition", ofType:"plist")
    @towerPositions = NSArray.arrayWithContentsOfFile(@plistPath)

    @towerPositions.each do |towerPos|
      towerBase = OpenSpot.new(position: [towerPos.objectForKey("x").intValue, towerPos.objectForKey("y").intValue])
      self.addChild(towerBase)
      towerBases.addObject(towerBase)
    end
  end

  def waypoints
    @waypoints ||= []
  end

  def towers
    @towers ||= []
  end

  def towerBases
    @towerBases ||= []
  end

end
