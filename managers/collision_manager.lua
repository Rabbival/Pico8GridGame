function check_collisions()
    check_monster_bullet_collisions()
    destroy_sand_water_clashes()
    check_monster_player_collisions()
end


function check_monster_bullet_collisions()
    for enemy in all(enemies) do 
        for bullet in all(bullets) do 
            hit = bullet_hit_enemy(enemy, bullet)
            if hit != NO_HIT then 
                if hit == HIT_WITH_KNOCKBACK then 
                    move_unit(bullet.direction, enemy, ENEMY_BULLET_HIT_RECOIL)
                end
                enemy.type = bullet.type
                despawn(bullet)
            end
        end
    end
end

function bullet_hit_enemy(enemy, bullet) 
    if on_same_tile(enemy, bullet) then
        return HIT_WITH_KNOCKBACK
    else 
        bullet_previous_location = relative_location(reversed_direction(bullet.direction), bullet, 1) 
        if on_same_tile(enemy, bullet_previous_location) then
            return HIT_WITHOUT_KNOCKBACK
        end
    end
    return NO_HIT
end 

function destroy_sand_water_clashes()
    for enemy in all(enemies) do 
        tile_type = map[enemy.row][enemy.col] 
        water_on_sand = tile_type == SAND_TYPE and enemy.type == WATER_TYPE
        sand_on_water = tile_type == WATER_TYPE and enemy.type == SAND_TYPE
        if water_on_sand or sand_on_water then 
            despawn(enemy)
        end 
    end
end

function check_monster_player_collisions()
    for enemy in all(enemies) do 
        if on_same_tile(enemy, player) then 
            declare_game_over()
        end
    end
end