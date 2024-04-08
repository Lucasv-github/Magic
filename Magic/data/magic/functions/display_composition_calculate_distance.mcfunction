function magic:calculate_distance
scoreboard players operation Temp reg_1 = @s player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see
function magic:display_composition