function rnd_whole_exc(min, max)
    return flr(rnd(max-min)) + flr(min)
end

function rnd_exclude_range(min, max, exclude_min, exclude_max)
    min_range_num = rnd_whole_exc(min, exclude_min)
    max_range_num = rnd_whole_exc(exclude_max, max)
    if min >= exclude_min then
        return max_range_num
    elseif max <= exclude_max then
        return min_range_num
    else
        return choose_random(max_range_num, min_range_num)
    end
end

function choose_random(first_option, second_option)
    if rnd() > 0.5 then
        return first_option
     else
         return second_option
     end
end