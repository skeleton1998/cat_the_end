module CatGame 
  module Stage1
    CAR_LINES = [{x: 100, y: 0},{x: 400, y: 0},{x: 500, y: 0}]
    CAR_LINE_WIDTH = 100
    CAR_LINE_HEIGHT = Window.height + 200
    CAR_LINE_IMAGE = "images/road.png"
    SEC_TO_FRAME = 60
    CYCLE_FRAME = 3 * SEC_TO_FRAME
    CAR_START_Y = - CAR_LINE_WIDTH
    BACK_GROUND_IMAGE = "images/stage1_background.png"

    class Manager < ManagerDefine
      def initialize
        super
        @bg_img = Image.load(BACK_GROUND_IMAGE)
        set_cat
        set_car_lines
        set_player
        @items = []
        @cars = []
      end

      def play
        Window.draw(0, 0, @bg_img)
        auto_spone_car
        draw_car_line
        sprite_update
        sprite_draw
        sprite_check
        if (item = @player.check_drop_item) != nil then
          add_item(item)
        end
        only_items = only_item_check(@items)
        vanish_only_items_without_last(only_items)
        run_passive
        draw_stage_name
      end

      private

      def draw_stage_name
      end

      def only_item_check(items)
        only_items = {}
        items.each do |item|
          if item.only_item? then
            item_class_string = item.class.to_s.split('::').last
            item_class_sym = item_class_string.to_sym
            if only_items[item_class_sym] == nil then
              only_items[item_class_sym] = Array.new
            end

            only_items[item_class_sym] << item unless item.float?
          end
        end

        return only_items
      end

      def vanish_only_items_without_last(only_items)
        only_last_items = {}
        only_items.each do |key, only_item|
          next if only_item == []
          only_item.pop
          only_item.each do |item|
            item.vanish 
          end
        end
      end

      # TODO: 汎用化するか，もしくはメソッド名を変える
      def run_passive
        @items.each do |item|
          next if item.vanished?
          next if item.x < @cat.x
          @cat.change_state_to_running(target: item) if item.passive == :running
        end
      end

      def sprite_draw
        @cat.draw
        Sprite.draw(@cars)
        Sprite.draw(@items)
        @player.draw
      end

      def sprite_update
        @cat.update
        Sprite.update(@cars)
        Sprite.update(@items)
        @player.update
      end

      def sprite_check
        Sprite.check(@cars, @cat)
        Sprite.check(@cars, @items)
        Sprite.check(@items, @cat)
      end

      def draw_car_line
        @car_lines.each do |line|
          Window.draw_scale(line[:x], line[:y], line[:image],
                            line[:width].to_f / line[:image].width,
                            line[:height].to_f / line[:image].height)
        end
      end

      def auto_spone_car
        @car_lines.each do |line|
          if Scene.current_frame % CYCLE_FRAME == line[:spone_frame]
            x = line[:x] + line[:width]/2.0
            y = CAR_START_Y
            @cars << Car.new(x, y, angle: 0, manager: self)
          end
        end
      end

      def add_item(item)
        @items << item
      end

      def set_cat
        @cat = Cat.new(CAT_DEFAULT_POS[:x], CAT_DEFAULT_POS[:y], manager: self)
      end
      
      def set_car_lines
        @car_lines = []
        car_line_image = Image.load(CAR_LINE_IMAGE)
        CAR_LINES.each_with_index do |line, i| 
          spone_frame = CYCLE_FRAME / CAR_LINES.length * i
          @car_lines << { x: line[:x], y: line[:y],
                          width: CAR_LINE_WIDTH, height: CAR_LINE_HEIGHT,
                          image: car_line_image, spone_frame: spone_frame }
        end
      end
    
      def set_player
        @player = Player.new(PLAYER_DEFAULT_POS[:x], PLAYER_DEFAULT_POS[:y])
      end
    end
  end
end