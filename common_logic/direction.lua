
UP=2 RIGHT=1 DOWN=3 LEFT=0
DIRECTIONS = {UP,RIGHT,DOWN,LEFT}

function reversed_direction(direction)
    if direction == UP then 
        return DOWN 
    elseif direction == RIGHT then 
        return LEFT 
    elseif direction == DOWN then
        return UP 
    else 
        return RIGHT 
    end
end