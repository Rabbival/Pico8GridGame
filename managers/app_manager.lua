function init_app_state()
    app_state = INSTRUCTIONS
end

function set_app_state_to_game()
    app_state = GAME_PLAYING
end

function listen_for_start_requests()
    if btnp(RESTART_GAME_BUTTON) then 
        start_game()
    end
end