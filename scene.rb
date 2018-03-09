Class Scene
  @@scene = nil

  Class << self
    def set_scene(scene:)
      @@scene = scene
    end

    def play
      @@scene.play if @@scene
    end
  end
end

