function init_app_state()
    app_state = INSTRUCTIONS
end

function declare_game_over()
    sfx(PLAYER_DEATH_SOUND)
    music(NO_MUSIC)
    app_state = GAME_OVER
end

function declare_victory()
    music(VICTORY_MUSIC)
    app_state = GAME_WON
end

function listen_for_start_requests()
    if btnp(RESTART_GAME_BUTTON) then 
        app_state = GAME_PLAYING
        start_game()
    end
end