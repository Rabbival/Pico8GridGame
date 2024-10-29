function _draw()
    cls()
    draw_map()
    draw_player()
    draw_enemies()
    draw_bullets()
    -- print(debugVal1)
    -- print(debugVal2)
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
    if tile_identifier == GRASS_TILE_IDNTIFIER then
        sprite_index = GRASS_TILE_SPRITE
    elseif tile_identifier == SAND_TILE_IDNTIFIER then 
        sprite_index = SAND_TILE_SPRITE
    else
        sprite_index = WATER_TILE_SPRITE
    end
    x = world_from_tile_axis(col_index)
    y = world_from_tile_axis(row_index)
    spr(sprite_index, x, y) 
end

function draw_player()
    if player.form == GRASS_TILE_IDNTIFIER then
        if player.heading_direction == UP then
            sprite_index = PLAYER_GRASS_BACK_SPRITE
        else
            sprite_index = PLAYER_GRASS_SPRITE
        end
    end
    if player.form == SAND_TILE_IDNTIFIER then 
        if player.heading_direction == UP then
            sprite_index = PLAYER_DESERT_BACK_SPRITE
        else
            sprite_index = PLAYER_DESERT_SPRITE
        end
    end
    if player.form == WATER_TILE_IDNTIFIER then
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
    spr(ENEMY_SPRITE, world_from_tile_axis(enemy.col), world_from_tile_axis(enemy.row)) 
end

function draw_bullets()
    for bullet in all(bullets) do 
        draw_bullet(bullet)
    end
end

function draw_bullet(bullet)
    if bullet.type == GRASS_TILE_IDNTIFIER then
        sprite_index = GRASS_BULLET_SPRITE
    elseif bullet.type == SAND_TILE_IDNTIFIER then 
        sprite_index = SAND_BULLET_SPRITE
    elseif bullet.type == WATER_TILE_IDNTIFIER then
        sprite_index = WATER_BULLET_SPRITE
    end
    spr(sprite_index, world_from_tile_axis(bullet.col), world_from_tile_axis(bullet.row)) 
end