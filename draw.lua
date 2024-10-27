function _draw()
    cls()
    draw_map()
    draw_player()
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
    elseif tile_identifier == WATER_TILE_IDNTIFIER then
        sprite_index = WATER_TILE_SPRITE
    end
    x = world_from_tile_axis(col_index)
    y = world_from_tile_axis(row_index)
    spr(sprite_index, x, y) 
end

function draw_player()
    if player.form == GRASS_TILE_IDNTIFIER then
        sprite_index = PLAYER_GRASS_SPRITE
    elseif player.form == SAND_TILE_IDNTIFIER then 
        sprite_index = PLAYER_DESERT_SPRITE
    elseif player.form == WATER_TILE_IDNTIFIER then
        sprite_index = PLAYER_WATER_SPRITE
    end
    spr(sprite_index, world_from_tile_axis(player.col), world_from_tile_axis(player.row)) 
end