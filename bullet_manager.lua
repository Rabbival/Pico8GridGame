function init_bullet_list()
    bullets = {}
end

function spawn_bullet(location, heading_direction, bullet_type)
    bullet = {}
    bullet.row = location.row
    bullet.col = location.col
    bullet.direction = heading_direction
    bullet.type = bullet_type
    add(bullets, bullet)
end