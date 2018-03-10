class Scene
  @@current_scene = nil

  class << self
    def set_current_scene(scene: nil)
      @@current_scene = scene
    end

    def play
      @@current_scene.play if @@current_scene
    end
  end
end