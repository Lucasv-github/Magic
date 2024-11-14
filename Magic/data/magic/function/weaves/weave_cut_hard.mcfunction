#Self dispose
tag @s add cut
tag @s remove actively_held
scoreboard players set @s weave_remaining_time 0

scoreboard players operation Temp reg_1 = @s current_held

#Nearest other either tied off or held
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,tag=!cut,scores={weave_remaining_time=1..}, tag=tied_off] run tag @s add getting_cut
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,tag=!cut,tag=actively_held] run tag @s add getting_cut
execute as @e[limit=1, sort=nearest, type=armor_stand, tag=target_point, distance=..10,tag=!cut,tag=gateway_end] run tag @s add getting_cut


#Snap back
#To self
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held run scoreboard players operation Temp reg_1 = @s player_id
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run damage @s 1
execute if score Temp reg_1 < @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run clear @s minecraft:ender_eye 4

#To opponent
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held run scoreboard players operation Temp reg_1 = @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] player_id
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run damage @s 1
execute if score Temp reg_1 > @e[tag=getting_cut,limit=1,sort=arbitrary,tag=actively_held] current_held as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run clear @s minecraft:ender_eye 4

tag @e[tag=getting_cut,limit=1,sort=arbitrary] add cut

#Clutter for handling gateways
execute as @e[tag=getting_cut,tag=gateway_end] run scoreboard players operation Temp reg_1 = @s weave_execute_random_number
execute as @e[tag=getting_cut,tag=gateway_end] as @e[tag=holds_travel] if score @s weave_execute_random_number = Temp reg_1 run function magic:cleanup/remove_cleanup
execute as @e[tag=getting_cut,tag=gateway_end] as @e[tag=holds_travel] if score @s weave_execute_random_number = Temp reg_1 run tag @s remove getting_cut

scoreboard players set @e[tag=getting_cut,limit=1,sort=arbitrary] weave_remaining_time 0

execute as @e[tag=getting_cut] run function magic:cleanup/remove_cleanup

#The following will remove book from player if it has and also cause all the other weaves with same id to be removed

#Get id from thing getting cut
scoreboard players operation Temp reg_1 = @e[tag=getting_cut,limit=1,sort=arbitrary] player_id

#Get player_weave_index from thing getting cut
scoreboard players operation Temp reg_2 = @e[tag=getting_cut,limit=1,sort=arbitrary] player_weave_index
execute as @e[tag=getting_cut,limit=1,sort=arbitrary] store result storage remove_weave_index index int 1 run scoreboard players get Temp reg_2
execute as @e[tag=getting_cut,limit=1,sort=arbitrary] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:weave_handling/player_remove_weave with storage minecraft:remove_weave_index

tag @e remove getting_cut

#TODO hard snapback based on greate/less strength