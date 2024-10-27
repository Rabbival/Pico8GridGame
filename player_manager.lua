function spawn_player()
    player = {}
    player.row = PLAYER_INITIAL_ROW
    player.col = PLAYER_INITAL_COL
    player.form = map[player.row][player.col]
end


function update_player_location()
    for i=1,#valid_moves do 
        if btnp(valid_moves[i]) then
            move_player(valid_moves[i])
        end
    end
end

function move_player(direction)
    if direction == up then
        if player.row > 1 then
            player.row -= 1
        end
    elseif direction == right then
        if player.col < MAP_COL_COUNT then
            player.col += 1
        end
    elseif direction == down then
        if player.row < MAP_ROW_COUNT then
            player.row += 1
        end
    elseif direction == left then
        if player.col > 1 then
            player.col -= 1
        end
    end 
end

function update_player_form()
    player.form = map[player.row][player.col]
end