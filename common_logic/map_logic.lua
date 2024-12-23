function world_from_tile_axis(axis_index)
    return MAP_FIRST_TILE_OFFSET + axis_index * MAP_CELL_SIZE
end

function move_unit(direction, unit, delta)
    desired_location = relative_location(direction, unit, delta)
    if valid_tile(desired_location) then 
        unit.row = desired_location.row
        unit.col = desired_location.col
    elseif unit.map_exit_policy == DESPAWN then
        despawn(unit)
    end
end

function relative_location(direction, unit, delta)
    desired_location = {}
    desired_location.row = unit.row
    desired_location.col = unit.col
    if direction == UP then
        desired_location.row -= delta
    elseif direction == RIGHT then
        desired_location.col += delta
    elseif direction == DOWN then
        desired_location.row += delta
    elseif direction == LEFT then
        desired_location.col -= delta
    end
    return desired_location
end

function valid_tile(location)
    in_row_bounds = location.row > 0 and location.row <= MAP_ROW_COUNT
    in_col_bounds = location.col > 0 and location.col <= MAP_COL_COUNT
    return in_row_bounds and in_col_bounds
end

function on_same_tile(first, second) 
    return (first.col == second.col and first.row == second.row)
end

function tile_delta(first_location, second_location)
    delta = {}
    delta.col = second_location.col - first_location.col
    delta.row = second_location.row - first_location.row
    return delta
end