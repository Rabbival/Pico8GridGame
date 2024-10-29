function _update()
    update_player()
    update_enemies()
    update_bullets()
    check_collisions()
end

function destroy(unit)
    del(bullets, unit)
    del(enemies, unit)
end