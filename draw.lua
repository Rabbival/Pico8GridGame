function _draw()
    cls()
    print_text_by_game_state()
    if app_state == GAME_PLAYING then 
        draw_map()
        draw_player()
        draw_enemies()
        draw_bullets()
        draw_despawn_sprites()
    end
end

function draw_map()
    for row_index=1,MAP_ROW_COUNT do
        row = map[row_index]
        for col_index=1,MAP_COL_COUNT do
            draw_tile_in_index(row[col_index], row_index, col_index)
        end
    end
end

function draw_tile_in_index(tile_identifier, row_index, col_index)
    if tile_identifier == GRASS_TYPE then
        sprite_index = GRASS_TILE_SPRITE
    elseif tile_identifier == SAND_TYPE then 
        sprite_index = SAND_TILE_SPRITE
    else
        sprite_index = WATER_TILE_SPRITE
    end
    x = world_from_tile_axis(col_index)
    y = world_from_tile_axis(row_index)
    spr(sprite_index, x, y) 
end

function draw_player()
    if player.form == GRASS_TYPE then
        if player.heading_direction == UP then
            sprite_index = PLAYER_GRASS_BACK_SPRITE
        else
            sprite_index = PLAYER_GRASS_SPRITE
        end
    end
    if player.form == SAND_TYPE then 
        if player.heading_direction == UP then
            sprite_index = PLAYER_SAND_BACK_SPRITE
        else
            sprite_index = PLAYER_SAND_SPRITE
        end
    end
    if player.form == WATER_TYPE then
        if player.heading_direction == UP then
            sprite_index = PLAYER_WATER_BACK_SPRITE
        elseif player.heading_direction == DOWN then
            sprite_index = PLAYER_WATER_FORWARD_SPRITE
        elseif player.heading_direction == LEFT then
            sprite_index = PLAYER_WATER_LEFT_SPRITE
        else
            sprite_index = PLAYER_WATER_RIGHT_SPRITE
        end
    end
    spr(sprite_index, world_from_tile_axis(player.col), world_from_tile_axis(player.row)) 
end

function draw_enemies()
    for enemy in all(enemies) do 
        draw_enemy(enemy)
    end
end

function draw_enemy(enemy)
    if enemy.type == GRASS_TYPE then
        sprite_index = ENEMY_GRASS_SPRITE
    elseif enemy.type == SAND_TYPE then 
        sprite_index = ENEMY_SAND_SPRITE
    elseif enemy.type == WATER_TYPE then
        sprite_index = ENEMY_WATER_SPRITE
    else 
        sprite_index = ENEMY_NEUTRAL_SPRITE
    end
    spr(sprite_index, world_from_tile_axis(enemy.col), world_from_tile_axis(enemy.row)) 
end

function draw_bullets()
    for bullet in all(bullets) do 
        draw_bullet(bullet)
    end
end

function draw_bullet(bullet)
    if bullet.type == GRASS_TYPE then
        sprite_index = GRASS_BULLET_SPRITE
    elseif bullet.type == SAND_TYPE then 
        sprite_index = SAND_BULLET_SPRITE
    elseif bullet.type == WATER_TYPE then
        sprite_index = WATER_BULLET_SPRITE
    end
    spr(sprite_index, world_from_tile_axis(bullet.col), world_from_tile_axis(bullet.row)) 
end

function draw_despawn_sprites()
    for despawn_sprite in all(despawn_sprites) do 
        spr(despawn_sprite.sprite, world_from_tile_axis(despawn_sprite.col), world_from_tile_axis(despawn_sprite.row)) 
    end
end