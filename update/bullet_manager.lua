function init_bullet_list()
    bullets = {}
end

function spawn_bullet(location, heading_direction, bullet_type)
    bullet = {}
    bullet.row = location.row
    bullet.col = location.col
    bullet.direction = heading_direction
    bullet.type = bullet_type
    bullet.map_exit_policy = DESPAWN
    add(bullets, bullet)
end

function update_bullets()
    if player.just_moved then 
        update_bullet_locations()
    end
end

function update_bullet_locations()
    for bullet in all(bullets) do 
        move_unit(bullet.direction, bullet)
    end
end