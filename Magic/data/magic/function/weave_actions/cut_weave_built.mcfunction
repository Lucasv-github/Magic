################################################################################
#Purpose: Cut any built (non placed) weaves of the targeted entity
#Runner: An armorstand holding a cut built weave
#Return values:
#Authors: Lprogrammer
################################################################################

#as @e[tag=can_use,tag=using] if score @s entity_id = Temp reg_1 run function magic:weave_actions/cut_weave_built

scoreboard players operation Temp reg_1 = @s current_draw

scoreboard players operation Temp reg_2 = @s weave_locked_entity_id
execute as @e[tag=using,tag=can_use,tag=built] if score @s entity_id = Temp reg_2 run tag @s add getting_cut

#Make sure it is not placed
execute as @e[tag=getting_cut] run function magic:detections/verify_weave_placed
execute as @e[tag=getting_cut,scores={reg_1=1}] run tag @s remove getting_cut

#Snap back
#To self
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1] current_draw run scoreboard players operation Temp reg_2 = @s weave_owner_player_id
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run damage @s 1
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 4

#To opponent
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1] current_draw run scoreboard players operation Temp reg_2 = @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] weave_owner_player_id
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run damage @s 1
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 4

execute as @e[tag=getting_cut,limit=1] store result storage magic:remove_weave_index index int 1 run scoreboard players get @s player_weave_index
execute as @e[tag=getting_cut,limit=1] run function magic:weave_handling/player_remove_weave with storage magic:remove_weave_index

tag @e remove getting_cut

