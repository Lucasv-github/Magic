################################################################################
#Purpose: Cut the nearest active tied off or actiely held weave
#Runner: An armorstand holding a cut weave, run via base_weaves/weave_cut_iteration.mcfunction or weave_actions/lightning_spread.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#This function is run as the cutting weave
scoreboard players operation Temp reg_1 = @s current_draw

#Prevent locking on this weave as it is closest
tag @s add self_block_temp

#Nearest other weave, either tied off or held
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,scores={weave_remaining_time=1..}, tag=tied_off, tag=!self_block_temp] run tag @s add getting_cut
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,tag=actively_held, tag=!self_block_temp] run tag @s add getting_cut
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,tag=gateway_end, tag=!self_block_temp] run tag @s add getting_cut

tag @s remove self_block_temp

#Snap back
#To self
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw run scoreboard players operation Temp reg_2 = @s weave_owner_player_id
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run damage @s 1
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 4

#To opponent
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw run scoreboard players operation Temp reg_2 = @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] weave_owner_player_id
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run damage @s 1
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_draw as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 4


#Clutter for handling gateways
execute as @e[tag=getting_cut,tag=gateway_end] run scoreboard players operation Temp reg_1 = @s player_weave_index
execute as @e[tag=getting_cut,tag=gateway_end] as @e[tag=holds_travel] if score @s player_weave_index = Temp reg_1 run function magic:weave_handling/remove_weave
execute as @e[tag=getting_cut,tag=gateway_end] as @e[tag=holds_travel] if score @s player_weave_index = Temp reg_1 run tag @s remove getting_cut

scoreboard players set @e[tag=getting_cut,limit=1,sort=arbitrary] weave_remaining_time 0

execute as @e[tag=getting_cut] run function magic:weave_handling/remove_weave
tag @e remove getting_cut

#TODO hard snapback based on greate/less strength