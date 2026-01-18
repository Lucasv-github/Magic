scoreboard players operation Temp reg_1 = @s weave_owner_player_id

#Sink draw-drain to not sink too much if other weaves

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @e if score @s entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_draw
execute as @e if score @s entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 -= @s current_drain

scoreboard players operation Temp reg_2 /= 10 reg_1
scoreboard players operation @s current_sink = Temp reg_2


tag @s add weave_sink_power
