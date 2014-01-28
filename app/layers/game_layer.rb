class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    background = Sprite.new file_name: 'bg.png', position: Screen.center
    self << background

    loadTowerPositions

    on_touches_began do |touches, event|

      touch = touches.any_object

      base = @towerBases.detect { |tb| tb.touched?(touch.location) }

      if base.canBuyTower?
        tower = Tower.nodeWithTheGame(self, location: base.position)
        towers.addObject(tower)
        # tb.userData = (__bridge void *)(tower)
      end

    end

  end

  def loadTowerPositions
    @plistPath = NSBundle.mainBundle.pathForResource("common/TowersPosition", ofType:"plist")
    @towerPositions = NSArray.arrayWithContentsOfFile(@plistPath)
    @towerBases = NSMutableArray.alloc.initWithCapacity(10)

    @towerPositions.each do |towerPos|
      towerBase = CustomSprite.spriteWithFile("open_spot.png")
      self.addChild(towerBase)
      towerBase.setPosition([towerPos.objectForKey("x").intValue, towerPos.objectForKey("y").intValue])
      @towerBases.addObject(towerBase)
    end
  end

end
