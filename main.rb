require 'dxruby'

Window.width = 800
Window.height = 600

require_relative 'scene'
require_relative 'scene_define'
require_relative 'title/director'
require_relative 'descript/director'
require_relative 'cat_game/director'
require_relative 'ending/director'

Scene.set_current_scene(scene: Title::Director.new)

Window.loop do
  Scene.set_current_scene(scene: Title::Director.new) if Input.key_push?(K_ESCAPE)

  Scene.play
end