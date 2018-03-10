class ManagerDefine
  def initialize
    @is_finished = false
    @is_clear = false
    @is_failed = false
  end
  
  def finished?
    return @is_finished
  end

  def clear?
    return @is_cleared
  end

  def failed?
    return @is_failed
  end

  def play
    raise NotImplementedError
  end
end