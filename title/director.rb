module Title
  class Director < SceneDefine
    START_LEFT = 120;    START_UPPER = 240
    def initialize
      super
      set_image
      set_menus
    end

    def 
    end

    def play
      Window.draw(0,0,@bg_img)
      super
    end

    private

    def set_image
      @bg_img = Image.load("images/title_background.png")
      @start_img = Image.load("images/start")
    end

    def set_menus
      @menus = []
      @menus << { x: START_LEFT, y: START_UPPER, image: @start_img 
                  width: @start_img.width, height: @start_img.height }
      @menus << { x: DESCRIPT_LEFT, y: DESCRIPT_UPPER, image: @descript_img 
                  width: @descript_img.width, height: @descript_img.height }
    end
  end
end