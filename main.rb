require 'dxruby'

require_relative 'scene'
require_relative 'scene_util'
require_relative 'title/director'
require_relative 'cat_game/director'
require_relative 'ending/director'

Scene.set_scene(scene: Title::Director.new)

Window.loop do
  exit if Input.key_push?(K_ESCAPE)

  Scene.play
end