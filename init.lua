function _init()
    init_app_state()
end

function start_game()
    music(0)
    set_app_state_to_game()
    init_despawn_sprites()
    init_bullet_list()
    generate_map()
    spawn_player()
    spawn_enemies()
end