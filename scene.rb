class Scene
  @@current_scene = nil
  @@current_frame = 0

  class << self
    def set_current_scene(scene: nil)
      @@current_scene = scene
    end

    def current_frame
      return @@current_frame
    end

    def should_update?(frame)
      return @@current_frame % frame == 0
    end

    def play
      @@current_scene.play if @@current_scene
      @@current_frame += 1
    end
  end
end