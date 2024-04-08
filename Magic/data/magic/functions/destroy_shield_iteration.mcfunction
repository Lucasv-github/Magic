scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s player_weave_index

execute as @s[tag=actively_held] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:stun

execute as @s[tag=actively_held] store result storage remove_weave_index index int 1 run scoreboard players get Temp reg_2 
execute as @s[tag=actively_held] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:player_remove_weave with storage minecraft:remove_weave_index

function magic:remove_cleanup
tag @s remove destroy_weave