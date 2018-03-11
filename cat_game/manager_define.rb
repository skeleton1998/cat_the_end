require_relative 'objects/item_define'
require_relative 'objects/items/master'
require_relative 'objects/items/matatabi'

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

  def clear
    return if @is_finished
    @is_finished = true
    @is_cleared = true
  end

  def failed?
    return @is_failed
  end

  def fail
    return if @is_finished
    @is_finished = true
    @is_failed = true
  end

  def play
    raise NotImplementedError
  end
end