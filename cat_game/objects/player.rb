module CatGame
  class Player < Sprite
    ALPHA_MAX = 255
    SCOPE_ALPHA_RATE = 0.3

    def initialize(x, y, image: nil)
      image = Image.load("images/scope.png")
      image.set_color_key(C_WHITE)
      super
      self.image = image
      self.alpha = (ALPHA_MAX * SCOPE_ALPHA_RATE).to_i
    end

    def update 
      self.x = Input.mouse_pos_x - self.image.width/2.0
      self.y = Input.mouse_pos_y - self.image.height/2.0
    end

    def check_drop_item
      return Matatabi.new(self.x, self.y) if Input.mouse_push?(M_LBUTTON)
      return Master.new(self.x, self.y) if Input.mouse_push?(M_RBUTTON)
    end

    def hit 
    end
  end
end