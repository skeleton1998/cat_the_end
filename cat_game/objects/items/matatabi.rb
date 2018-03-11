module CatGame 
  MATATABI_IMAGE = "images/matatabi.png"

  class Matatabi < ItemDefine
    def initialize(x, y, image: nil)
      image = Image.load(MATATABI_IMAGE)
      image.set_color_key(C_WHITE)
      super
      self.image = image
    end

    def hit_cat
      self.vanish
      return :playful
    end

    def passive
      return :normal
    end
    
    def only_item?
      return true
    end

    def update
      super
    end
  end
end