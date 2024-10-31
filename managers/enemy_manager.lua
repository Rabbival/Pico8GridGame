function spawn_enemies()
    enemies = {}
    for i=1,ENEMY_COUNT do
        newborn_enemy = spawn_enemy()
        add(enemies, newborn_enemy)
    end
end

function spawn_enemy()
    enemy = {}
    enemy.row = rnd_exclude_range(1, MAP_ROW_COUNT, player.row-1, player.row+1)
    enemy.col = rnd_exclude_range(1, MAP_COL_COUNT, player.col-1, player.col+1)
    enemy.path = determine_path_to_player(enemy)
    enemy.next_move_index = 1
    enemy.heading_direction = enemy.path[1]
    enemy.map_exit_policy = DESPAWN
    enemy.type = NEUTRAL
    return enemy
end

function update_enemies()
    update_enemy_paths_if_player_moved()
    move_enemies_along_path_if_player_acted()
end

function update_enemy_paths_if_player_moved()
    if player.just_moved do 
        for enemy in all(enemies) do 
            enemy.path = determine_path_to_player(enemy)
            enemy.next_move_index = 1
        end
    end
end


function move_enemies_along_path_if_player_acted()
    for i=1,player.acts_this_turn do
        for enemy in all(enemies) do 
            move_enemy_along_path(enemy)
        end
    end
end

function move_enemy_along_path(enemy)
    if enemy.next_move_index <= count(enemy.path) do 
        next_move_direction = enemy.path[enemy.next_move_index]
        move_unit(next_move_direction, enemy, 1)
        enemy.next_move_index += 1
        sfx(choose_random(ENEMY_STEP_SOUND_1, ENEMY_STEP_SOUND_2))
    end
end

function determine_path_to_player(enemy)
    delta_to_player = tile_delta(enemy_location(enemy), player_location())
    return tile_delta_to_direction_seq(delta_to_player)
end

function enemy_location(enemy)
    location = {}
    location.col = enemy.col
    location.row = enemy.row
    return location
end
