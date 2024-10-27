function rnd_whole_exc(min, max)
    return flr(rnd(max-min)) + flr(min)
end

function world_from_tile_axis(axis_index)
    return MAP_FIRST_TILE_OFFSET + axis_index * MAP_CELL_SIZE
end