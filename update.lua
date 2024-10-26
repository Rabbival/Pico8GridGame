
function _update()
    shoot()
    update_bullet_locations(bullets)
    move_player()
    move_enemies()
    check_for_grass_removal()
    check_game_over()
    check_bullets_collisions()
    tick_enemy_spawner()
    listen_for_game_reset()
 end

 function tick_enemy_spawner()
    if time_left_to_new_spawn <= 0 then
        spawn_enemy()
        current_enemy_interval = max(min_enemy_interval, current_enemy_interval - 1)
        time_left_to_new_spawn = current_enemy_interval
        enemy_speed = min(max_enemy_speed, enemy_speed+0.05)
    end
    time_left_to_new_spawn -= 1
 end

function spawn_enemy()
    if count(enemies) < max_enemies_count then
        config_index_one_or_two = flr(rnd(2)) + 1 
        add(enemies, insantiate_enemy(config_index_one_or_two))
    end
 end
 
 function insantiate_enemy(config_index_one_or_two)
    enemy = {}
    enemy.startsprite = 7
    enemy.endsprite = 8
    enemy.speed = enemy_speed
    enemy.sprite = 7
    enemy.x = enemy_spawn_x[config_index_one_or_two]
    enemy.y = ground_height
    enemy.initial_direction = left
    if enemy.x > player.x then
        enemy.face_direction = left
    end
    if enemy.x < player.x then
        enemy.face_direction = right
    end
    return enemy
 end

 function check_bullets_collisions()
    for bullet in all(bullets) do
        for enemy in all(enemies) do
            if distance(bullet,enemy) < 7 then
                del(enemies,enemy)
                del(bullets,bullet)
                sfx(3)
            end
        end
    end
 end

 function shoot()
    if btnp(4) then 
        should_flip = false
        if player.face_direction != player.initial_direction then
            should_flip = true
        end
        add(bullets, insantiate_bullet(should_flip))
        sfx(0)
    end
 end

 function insantiate_bullet(should_flip)
    bullet = {}
    if should_flip then
        bullet.x = player.x - 7
    else
        bullet.x = player.x + 7
    end
    bullet.flipped = should_flip
    return bullet
 end

 function update_bullet_locations(bullets)
   for bullet in all(bullets) do
        if bullet.flipped then
            bullet.x -= bullet_speed
            if bullet.x < furthest_left then
                del(bullets,bullet)
            end
        else
            bullet.x += bullet_speed
            if bullet.x > furthest_right then
                del(bullets,bullet)
            end
        end
    end
 end
   
function move_unit(unit, direction)
    original_facing = unit.face_direction
    if direction == left and
        unit.x - unit.speed > furthest_left then
        unit.x -= unit.speed
        unit.moving = true
        unit.face_direction = left
    end
    if direction == right and
        unit.x + unit.speed < furthest_right then
        unit.x += unit.speed
        unit.moving = true
        unit.face_direction = right
    end
    if not unit.moving then
        unit.sprite = unit.startsprite
    else
        update_sprite_index(unit)
    end
end

 
function update_sprite_index(unit)
    unit.sprite += 1
    if unit.sprite > unit.endsprite then
     unit.sprite = unit.startsprite
    end
end
   
function refresh_unit_settings(unit)
    player.moving = false
end

function move_player()
    refresh_unit_settings(player)
    for i=1,#valid_moves do 
        if btn(valid_moves[i]) then
        move_unit(player, valid_moves[i])
        end
    end
end
   
function move_enemies()
    for enemy in all(enemies) do
        refresh_unit_settings(enemy)
        if enemy.x > player.x then
         move_unit(enemy, left)
        end
        if enemy.x < player.x then
         move_unit(enemy, right)
        end
        enemy.speed += 0.005
    end
end

function check_for_grass_removal()
    for grass_block in all(grass_blocks) do
        for enemy in all(enemies) do
            if distance(enemy,grass_block) < 7 then
                del(grass_blocks,grass_block)
                sfx(10)
            end
        end
    end
end
   
function check_game_over()
    for enemy in all(enemies) do
        if (distance(enemy,player) < 7 or distance(enemy,princess_bakod) < 7)  and state != game_over then
          state = start_end_game
          clear_entities()
          music(-1, 500)
       end
    end
end
   
function distance(p0, p1)
    return abs(p0.x-p1.x) 
end

function clear_entities()
    for bullet in all(bullets) do
        del(bullets,bullet)
    end
    for enemy in all(enemies) do
        del(enemies,enemy)
    end
    for grass_block in all(grass_blocks) do
        del(grass_blocks,grass_block)
    end
end
   
function listen_for_game_reset()
    if btnp(4) and state == game_over then 
        _init() 
    end
end