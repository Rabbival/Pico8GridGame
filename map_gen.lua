function generate_map()
    map = {}
    fill_map()
end


function fill_map()
    for row=1,MAP_ROW_COUNT do
        add(map, generate_row())
    end
end

function generate_row()
    row = {}
    grass_count = rnd_whole_exc(MIN_GRASS_PER_ROW, MAX_GRASS_PER_ROW)
    sand_count = rnd_whole_exc(MIN_SAND_PER_ROW, MAX_SAND_PER_ROW)
    water_count = MAP_COL_COUNT - (grass_count + sand_count)
    for index=1,MAP_COL_COUNT do
        chosen_tile_identifier = pick_random_tile(grass_count, sand_count, water_count)
        if chosen_tile_identifier == GRASS_TILE_IDNTIFIER then
            grass_count -= 1
        end
        if chosen_tile_identifier == SAND_TILE_IDNTIFIER then
            sand_count -= 1
        end
        if chosen_tile_identifier == WATER_TILE_IDNTIFIER then
            water_count -= 1
        end
        add(row, chosen_tile_identifier)
    end
    return row
end

function pick_random_tile(grass_count, sand_count, water_count)
    non_zeros = {}
    if grass_count != 0 then
        add(non_zeros, GRASS_TILE_IDNTIFIER)
    end
    if sand_count != 0 then
        add(non_zeros, SAND_TILE_IDNTIFIER)
    end
    if water_count != 0 then
        add(non_zeros, WATER_TILE_IDNTIFIER)
    end
    chosen_tile_type_index = rnd_whole_exc(1, count(non_zeros)+1)
    return non_zeros[chosen_tile_type_index]
end
