function tile_delta_to_direction_seq(tile_delta)
    move_sequence = {}
    tile_delta_move_count = abs(tile_delta.col) + abs(tile_delta.row)
    for i=1,tile_delta_move_count do
        next_direction_candidates = {}
        if tile_delta.col > 0 then
            add(next_direction_candidates, RIGHT)
        end
        if tile_delta.col < 0 then
            add(next_direction_candidates, LEFT)
        end
        if tile_delta.row > 0 then
            add(next_direction_candidates, DOWN)
        end
        if tile_delta.row < 0 then
            add(next_direction_candidates, UP)
        end
        chosen_direction = choose_direction_from_candidates(next_direction_candidates)
        add_direction_to_seq_from_delta(tile_delta, move_sequence, chosen_direction)
    end
    return move_sequence
end

function choose_direction_from_candidates(next_direction_candidates)
    if count(next_direction_candidates) == 2 then 
        return choose_random(next_direction_candidates[1], next_direction_candidates[2])
    else
        return next_direction_candidates[1]
    end
end

function add_direction_to_seq_from_delta(tile_delta, move_sequence, direction)
    add(move_sequence, direction)
    if direction == RIGHT then
        tile_delta.col -= 1
    elseif direction == LEFT then
        tile_delta.col += 1
    elseif direction == DOWN then
        tile_delta.row -= 1
    else 
        tile_delta.row += 1
    end
end
