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
    listen_for_shooting_requests()
end


function update_player_location()
    player.just_moved = false
    for i=1,count(DIRECTIONS) do 
        direction = DIRECTIONS[i]
        if btnp(direction) then
            if direction != player.heading_direction then
                player.heading_direction = direction
                break
            else
                player.acts_this_turn += 1
                player.just_moved = true
                move_unit(direction, player, 1)
                break
            end
        end
    end
end

function update_player_form()
    player.form = map[player.row][player.col]
end

function listen_for_shooting_requests()
    desired_bullet_location = relative_location(player.heading_direction, player, 1)
    if btnp(SHOOT_BUTTON) and valid_tile(desired_bullet_location) then
        player.acts_this_turn += 1
        spawn_bullet(player_location(), player.heading_direction, player.form)
    end
end

function player_location()
    location = {}
    location.col = player.col
    location.row = player.row
    return location
end