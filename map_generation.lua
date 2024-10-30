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
    tile_count_dictionary = initialize_tile_count_dictionary()
    for index=1,MAP_COL_COUNT do
        chosen_tile_identifier = pick_random_tile(tile_count_dictionary)
        for i=1,count(tile_count_dictionary) do 
            if chosen_tile_identifier == tile_count_dictionary[i].key then 
                tile_count_dictionary[i].value -= 1
            end
        end
        add(row, chosen_tile_identifier)
    end
    return row
end

function initialize_tile_count_dictionary()
    tile_count_dictionary = {}
    grass_count = rnd_whole_exc(MIN_GRASS_PER_ROW, MAX_GRASS_PER_ROW)
    add_key_value_to_dictionary(tile_count_dictionary, GRASS_TYPE, grass_count)
    sand_count = rnd_whole_exc(MIN_SAND_PER_ROW, MAX_SAND_PER_ROW)
    add_key_value_to_dictionary(tile_count_dictionary, SAND_TYPE, sand_count)
    water_count = MAP_COL_COUNT - (grass_count + sand_count)
    add_key_value_to_dictionary(tile_count_dictionary, WATER_TYPE, water_count)
    return tile_count_dictionary
end

function pick_random_tile(tile_count_dictionary)
    non_zeros = {}
    for i=1,count(tile_count_dictionary) do 
        if tile_count_dictionary[i].value != 0 then 
            add(non_zeros, tile_count_dictionary[i].key)
        end
    end
    chosen_tile_type_index = rnd_whole_exc(1, count(non_zeros)+1)
    return non_zeros[chosen_tile_type_index]
end
