class SceneDefine
  SEC_TO_FRAME = 60

  def initialize
    @count = -1
    @next_scene = nil
    @is_finished = false
  end

  def count_down
    @count -= 1 if @count > 0
    return @count <= 0 && @count > -1
  end

  def move_next_scene
    unless @next_scene then
      STDERR.print "from #{self.class}, next_scene is nil"
      exit
    end
    Scene.set_current_scene(scene: @next_scene)
  end

  def finish(time: 0)
    @is_finished = true
    @count = time * SEC_TO_FRAME
  end

  def play
    move_next_scene if count_down
    return if @is_finished
  end
end