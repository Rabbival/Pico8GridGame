function init_despawn_sprites()
    despawn_sprites = {}
end


function despawn(unit)
    enemies_count_before = count(enemies)
    bullets_count_before = count(bullets)
    del(bullets, unit)
    del(enemies, unit)
    add(despawn_sprites, new_despawn_sprite(unit))
    if enemies_count_before > count(enemies) then 
        sfx(choose_random(ENEMY_DEATH_SOUND_1, ENEMY_DEATH_SOUND_2))
        if count(enemies) == 0 then 
            declare_victory()
        end
    end
    if bullets_count_before > count(bullets) then 
        sfx(BULLET_DESPAWN_SOUND)
    end
end

function new_despawn_sprite(unit)
    despawn_sprite = {}
    despawn_sprite.row = unit.row
    despawn_sprite.col = unit.col
    despawn_sprite.sprite = FIRST_DESPAWN_SPRITE_FRAME
    return despawn_sprite
end

function advance_despawn_animations()
    for despawn_sprite in all(despawn_sprites) do 
        advance_despawn_animation(despawn_sprite)
    end
end

function advance_despawn_animation(despawn_sprite)
    if despawn_sprite.sprite < LAST_DESPAWN_SPRITE_FRAME then 
        despawn_sprite.sprite += 1 
    else 
        del(despawn_sprites, despawn_sprite)
    end
end