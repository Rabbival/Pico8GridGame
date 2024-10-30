function print_text_by_game_state()
    if app_state == GAME_OVER then 
        print_game_over_message()
    elseif app_state == GAME_WON then 
        print_victory_message()
    elseif app_state == INSTRUCTIONS then 
        print_game_instructions()
    end
end

function print_game_over_message()
    print("you deathed, it seems.")
    print("press shooting button when ready.")
end

function print_victory_message()
    print("all monsters defeated! game won!")
    print("press shooting button to restart.")
end

function print_game_instructions()
    print("element + enemy to eliminate.\n")
    print("why? they're hunting you down!\n")
    print("how would that help you though?\n")
    print("in the desert, \nwater can't survive\n")
    print("sand is swept away \nby the stream.\n")
    print("they would only act when you do.\n\n")
    print("press shooting button when ready.\n")
end