class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    background = Sprite.new file_name: 'bg.png', position: Screen.center
    self << background

    loadTowerPositions
  end

  def loadTowerPositions
    plistPath = NSBundle.mainBundle.pathForResource("common/TowersPosition", ofType:"plist")
    towerPositions = NSArray.arrayWithContentsOfFile(plistPath)
    towerBases = NSMutableArray.alloc.initWithCapacity(10)

    towerPositions.each do |towerPos|
      towerBase = CCSprite.spriteWithFile("open_spot.png")
      self.addChild(towerBase)
      towerBase.setPosition([towerPos.objectForKey("x").intValue, towerPos.objectForKey("y").intValue])
      towerBases.addObject(towerBase)
    end
  end

end

