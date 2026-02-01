################################################################################
#Purpose: Get rest draw for player: (current_draw-current_drain)/rest_draw_count
#Runner: An armorstand holding a weave needing to figur out its owner's rest power
#Return values: Temp reg_1: rest_draw
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_2 = @s weave_owner_entity_id

scoreboard players set Temp reg_1 0

execute as @e[tag=using] if score @s entity_id = Temp reg_2 run scoreboard players operation Temp reg_1 = @s current_draw
execute as @e[tag=using] if score @s entity_id = Temp reg_2 run scoreboard players operation Temp reg_1 -= @s current_drain
execute as @e[tag=using] if score @s entity_id = Temp reg_2 run scoreboard players operation Temp reg_1 /= @s rest_draw_count