function _init()
 player = {}
 player.startsprite = 1
 player.endsprite = 3
 player.sprite = 1
 player.speed = 2
 player.x = 60
 player.y = ground_height
 player.face_direction = right
 player.initial_direction = right

 princess_bakod = {}
 princess_bakod.x = 60
 princess_bakod.sprite = 5

 enemies = {}
bullets = {}
grass_blocks = {}
spawn_grass()

 state = in_progress
 score = 0
 current_enemy_interval = 36
time_left_to_new_spawn = 0
enemy_speed = 0.2

 music(1)
end

function spawn_grass()
    grass_block_count = flr(rnd(max_grass_count)) + min_grass_count
    for i = 1, grass_block_count do
        grass_block = {}
        left_or_right = flr(rnd(2)) + 1 
        if left_or_right == 1 then
            grass_block.x = flr(rnd(20)) + 20
        else
            grass_block.x = flr(rnd(20)) + 80
        end
        grass_block.y = ground_height
        grass_block.sprite = 6
        grass_block.face_direction = left_or_right
        grass_block.initial_direction = left_or_right
        add(grass_blocks, grass_block)
    end
end
