scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used] if score @s weave_owner_player_id = Temp reg_1 run function magic:cleanup/remove_cleanup

#This is needed as a fallback to remove the data from those not placed
#This and other things would not however detect moving a weave into something else, a dedicated function would need to keep track and dispose of that
execute store result storage magic:remove_cleanup_player_all_iteration index int 1 run scoreboard players get 0 reg_1
function magic:cleanup/remove_cleanup_player_all_iteration with storage magic:remove_cleanup_player_all_iteration