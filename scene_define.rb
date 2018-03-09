Class SceneDefine
  def initialized
    @count = -1
    @next_scene = nil
  end

  def count_down
    @count -= 1 if @count > 0
    return @count == 0
  end

  def move_next_scene
    unless next_scene then
      STDERR.print "from #{self.class}, next_scene is nil"
      exit
    end
    Scene.set_current_scene(@next_scene)
  end

  def play
    move_next_scene if count_down
  end
end