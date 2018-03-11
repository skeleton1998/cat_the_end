module CatGame 
  class ItemDefine < Sprite
    ALPHA_MAX = 255
    FALL_TURN = 6
    SIZE_START_RATE = 1.0
    ALPHA_START_RATE = 0.4
    SIZE_FINISH_RATE = 0.4
    ALPHA_FINISH_RATE = 1.0 
  
    def initialize(x, y, image: nil)
      super
      @falling_turn = 0
    end
  
    def alpha
      add_rate = (ALPHA_FINISH_RATE - ALPHA_START_RATE) / FALL_TURN
      return ALPHA_MAX * @falling_turn * ( ALPHA_START_RATE + add_rate )
    end

    def size_rate
      add_rate = (SIZE_FINISH_RATE - SIZE_START_RATE) / FALL_TURN
      return @falling_turn * ( SIZE_START_RATE + add_rate )
    end
    
    def float?
      return @falling_turn < FALL_TURN
    end
  
    def update
      if float? and Scene.should_update?(10) then
        @falling_turn += 1
      end
    end

    def hit_cat
      raise NotImplementedError
    end
  
    def passive
    end

    def only_item?
      return false
    end

    def hit
      self.vanish unless float?
    end
  end
end