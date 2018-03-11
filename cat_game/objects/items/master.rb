module CatGame 
  MASTER_IMAGE = "images/master.png"

  class Master < ItemDefine
    def initialize(x, y, image: nil)
      image = Image.load(MASTER_IMAGE)
      image.set_color_key(C_WHITE)
      super
      self.image = image
    end

    def hit_cat
      self.vanish
      return :playful
    end

    def passive
      return :running
    end
    
    def only_item?
      return true
    end

    def update
      super
    end
  end
end