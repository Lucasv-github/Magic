################################################################################
#Purpose: Increase rest_draw_count for weave owner if not already increased for a weave, to equally share the rest power
#Runner: A weave that uses rest power: (current_draw-current_drain)
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id

execute as @s[tag=!rest_draw] as @e[tag=using] if score @s entity_id = Temp reg_1 run scoreboard players add @s rest_draw_count 1

tag @s add rest_draw