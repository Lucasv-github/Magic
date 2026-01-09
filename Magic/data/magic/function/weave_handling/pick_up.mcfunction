################################################################################
#Purpose: Pick up an active tied off weave near and made by @s
#Runner: A player going to pick up a weave, via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run playsound minecraft:block.lever.click player @s

scoreboard players operation Temp reg_1 = @s player_id

execute at @s as @e[type=armor_stand,scores={weave_remaining_time=1..},distance=..5,sort=nearest,tag=tied_off] if score @s weave_owner_player_id = Temp reg_1 run tag @s add pick_up_within_range_temp

#We only want one
execute at @s run tag @e[tag=pick_up_within_range_temp,limit=1] add pick_up_me_temp

#Make sure we can pick up something
execute if entity @e[tag=pick_up_me_temp] run tag @s add pick_up_picking_temp

scoreboard players operation Temp reg_1 = @s[tag=pick_up_picking_temp] weave_locked_player_id

#execute as @e[tag=pick_up_me_temp] run say getting_picked_up
#execute as @s[tag=pick_up_picking_temp] run say picking_up

tag @s[tag=pick_up_picking_temp] add built
tag @e[tag=pick_up_me_temp] remove tied_off
tag @e[tag=pick_up_me_temp] add actively_held

scoreboard players operation @s[tag=pick_up_picking_temp] stage = @e[tag=pick_up_me_temp] stage

scoreboard players operation @s[tag=pick_up_picking_temp] player_weave_index = @e[tag=pick_up_me_temp] player_weave_index

execute as @s[tag=pick_up_picking_temp] run function magic:weave_handling/give_current_weave

tag @e remove pick_up_within_range_temp
tag @e remove pick_up_me_temp
tag @s remove pick_up_picking_temp

scoreboard players set @s state 0
