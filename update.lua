function _update()
    if app_state == GAME_PLAYING then 
        advance_despawn_animations()
        update_player()
        update_enemies()
        update_bullets()
        check_collisions()
    else
        listen_for_start_requests()
    end
end