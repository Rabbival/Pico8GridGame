function world_from_tile_axis(axis_index)
    return MAP_FIRST_TILE_OFFSET + axis_index * MAP_CELL_SIZE
end

function move_unit(direction, unit)
    desired_location = relative_location(direction, unit)
    if valid_tile(desired_location) then 
        unit.row = desired_location.row
        unit.col = desired_location.col
    elseif unit.map_exit_policy == DESPAWN then
        destroy(unit)
    end
end

function relative_location(direction, unit)
    desired_location = {}
    desired_location.row = unit.row
    desired_location.col = unit.col
    if direction == UP then
        desired_location.row -= 1
    elseif direction == RIGHT then
        desired_location.col += 1
    elseif direction == DOWN then
        desired_location.row += 1
    elseif direction == LEFT then
        desired_location.col -= 1
    end
    return desired_location
end

function valid_tile(location)
    if location.row > 0 and location.row <= MAP_ROW_COUNT and location.col > 0 and location.col <= MAP_COL_COUNT then
        return true
    else
        return false
    end
end