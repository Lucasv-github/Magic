say WSP-s

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
#TODO enough spirit in weave (2x strenght/10 or something to make this work)
execute as @e[tag=can_use] if score @s entity_id = Temp reg_1 run function magic:power_handling/sever