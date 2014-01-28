class Tower

  def self.nodeWithTheGame(game, location)
    selfinitWithTheGame(game, location)
  end

  def initWithTheGame(game, location)
    theGame = game
    attackRange = 70
    damage = 10
    fireRate = 1

    mySprite = CustomSprite.spriteWithFile("tower.png")
    self.addChild(mySprite)

    mySprite.setPosition(location)

    theGame.addChild(self)

    self.scheduleUpdate
  end

end
