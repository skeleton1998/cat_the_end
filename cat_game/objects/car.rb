module CatGame
  class Car < Sprite
    VY = 2.0
    def initialize(x, y, image: nil, angle:, manager:)
      image = Image.load("images/car.png") unless image
      image.set_color_key(C_WHITE)
      super
      self.image = image
      self.angle = angle
      @manager = manager
    end

    def update
      self.y += VY
    end
    
    def hit_cat
      @manager.fail
    end

    def hit
    end
  end
end