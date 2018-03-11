require_relative 'manager_define'
require_relative 'stage1/manager'
require_relative 'stage2/manager'
require_relative 'objects/cat'
require_relative 'objects/player'
require_relative 'objects/car'

module CatGame
  CAT_DEFAULT_POS = { x: 0, y: Window.height/2.0 } 
  PLAYER_DEFAULT_POS = { x: Window.width/2.0, y: Window.height/2.0 }
  STAGE_SCENES = [ Stage1::Manager, Stage2::Manager ]
  START_STAGE = 0

  class Director < SceneDefine
    def initialize
      super
      @current_stage = STAGE_SCENES[START_STAGE].new
      @next_stage = START_STAGE
    end

    def play
      super

      if @current_stage.finished? then
        result_move = false
        result_move = move_stage if @current_stage.clear?

        reset_stage if result_move == false
        reset_stage if @current_stage.failed?
        remake_stage
        return
      end

      @current_stage.play
    end

    private

    def remake_stage
      @current_stage = STAGE_SCENES[@next_stage].new
    end

    def reset_stage
      @next_stage = START_STAGE
    end

    def move_stage
      @next_stage += 1
      return false if @next_stage >= START_STAGE.size
      return true
    end
  end
end