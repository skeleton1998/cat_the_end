module Title
  class Director < SceneDefine
    #START_LEFT = 120;                       START_UPPER = 240
    #DISCRIPT_LEFT = 120;                    DISCRIPT_UPPER = 440
    WINDOW_CENTER_X = Window.width/2.0;     WINDOW_CENTER_Y = Window.height/2.0
    SPACE_START_DESCRIPT = 120

    def initialize
      super
      set_image
      set_menus
      @mouse = Sprite.new(0, 0, @pointer_img)
    end

    def check_mouse_hit
      @menus.each do |key, menu|
        return key if @mouse === menu
      end

      return nil
    end

    def decude_menu
      case @current_decude
      when :start then
        @next_scene = CatGame::Director.new
      when :descript then
        @next_scene = Descript::Director.new
      else
        return
      end
      finish(time: 0.1)
    end

    def play
      super
      @mouse.x = Input.mouse_pos_x
      @mouse.y = Input.mouse_pos_y

      Window.draw(0,0,@bg_img)
      @menus.each do |menu|
        Sprite.draw(menu)
      end
      Sprite.draw(@mouse)

      @current_decude = check_mouse_hit

      decude_menu if @current_decude && Input.mouse_release?(M_LBUTTON)
    end

    private

    def set_image
      @bg_img = Image.load("images/title_background.png")
      @start_img = Image.load("images/title_start.png")
      @descript_img = Image.load("images/title_descript.png")
      @pointer_img = Image.load("images/mouse_pointer.png")
      @start_img.set_color_key(C_WHITE)
      @descript_img.set_color_key(C_WHITE)
      @pointer_img.set_color_key(C_WHITE)
    end

    def set_menus
      @menus = {}
      @menus[:start] = Sprite.new( WINDOW_CENTER_X - @start_img.width/2.0,
                                   WINDOW_CENTER_Y , @start_img )
      @menus[:descript] = Sprite.new( WINDOW_CENTER_X - @descript_img.width/2.0,
                                      WINDOW_CENTER_Y + SPACE_START_DESCRIPT, @descript_img )
    end
  end
end