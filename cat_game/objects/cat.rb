module CatGame
  class Cat < Sprite
    DEFAULT_VELOCITY = 2
    RUNNING_VELOCITY = 4
    RADIAN_TO_DEGREE = 180 / Math::PI 
    DEGREE_TO_RADIAN = Math::PI / 180
    NORMAL_CAT = Image.load("images/cat.png")
    NORMAL_CAT.set_color_key(C_WHITE)
    PLAYFUL_CAT = Image.load("images/playful_cat.png")
    PLAYFUL_CAT.set_color_key(C_WHITE)
    RUNNING_CAT = Image.load("images/run_cat.png")
    RUNNING_CAT.set_color_key(C_WHITE)

    def initialize(x, y, image: nil, manager:)
      image = NORMAL_CAT
      super
      @vx = DEFAULT_VELOCITY
      @vy = 0
      @state = :normal
      @manager = manager
      @playful_frame = 0
    end

    def update
      @manager.clear if self.x >= Window.width
      send(@state)

      self.angle = Math.atan2(@vy, @vx) * RADIAN_TO_DEGREE unless @state == :playful
      self.x += @vx
      self.y += @vy
    end

    def change_state_to_running(target:)
      @target = target
      @state = :running
    end

    def normal
      @vx = DEFAULT_VELOCITY
      @vy = 0
      self.image = NORMAL_CAT
      @playful_frame = 0
    end

    def playful
      @state = :normal if @playful_frame > 300
      @vx = 0
      @vy = 0
      self.angle = Math.sin(@playful_frame.to_f * 6.0 / 5.0 * DEGREE_TO_RADIAN ) * 75.0
      self.image = PLAYFUL_CAT
      @playful_frame += 1
    end

    def running
      dx = @target.x - self.x
      dy = @target.y - self.y
      angle = Math.atan2(dy, dx)
      @vx = RUNNING_VELOCITY * Math.cos(angle)
      @vy = RUNNING_VELOCITY * Math.sin(angle)
      self.image = RUNNING_CAT
      @playful_frame = 0
    end

    def hit(obj)
      @state = obj.hit_cat
    end
 end
end