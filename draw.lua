
function _draw()
    cls()
    if state == in_progress then
      map(0, 0, 0, 0, 16, 16)
      update_bullet_visuals(bullets)
      spr(princess_bakod.sprite, princess_bakod.x, ground_height) 
        update_unit_visuals(player)
        for enemy in all(enemies) do
         update_unit_visuals(enemy)
        end
        for grass_block in all(grass_blocks) do
          update_unit_visuals(grass_block)
        end
       score += 1
       print("score: "..score)
    elseif state == start_end_game then
       sfx(1)
       state = game_over
    elseif state == game_over then
      print_game_over_message()
    end
 end 
 
 function print_game_over_message()
   print("\135 game over \135")
   print("your final score was: "..score)
   print("press action to try again")
 end
 
 function update_bullet_visuals(bullets)
   for bullet in all(bullets) do
      spr(bullet_sprite, bullet.x, ground_height - 1, 1, 1, bullet.flipped, false) 
   end
 end
 
 function update_unit_visuals(unit) 
   should_flip = false
   if unit.face_direction != unit.initial_direction then
      should_flip = true
   end
    spr(unit.sprite, unit.x, unit.y, 1, 1, should_flip, false) 
 end