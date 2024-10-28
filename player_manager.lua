function spawn_player()
    player = {}
    player.row = PLAYER_INITIAL_ROW
    player.col = PLAYER_INITAL_COL
    player.form = map[player.row][player.col]
    player.acts_this_turn = 0
    player.just_moved = false
    player.heading_direction = DOWN
    player.map_exit_policy = BLOCK
end

function update_player()
    player.acts_this_turn = 0
    update_player_location()
    update_player_form()
end


function update_player_location()
    player.just_moved = false
    for i=1,#DIRECTIONS do 
        direction = DIRECTIONS[i]
        if btnp(direction) then
            player.acts_this_turn += 1
            player.just_moved = true
            player.heading_direction = direction
            move_unit(direction, player)
            break
        end
    end
end

function update_player_form()
    player.form = map[player.row][player.col]
end

function player_location()
    location = {}
    location.col = player.col
    location.row = player.row
    return location
end