################################################################################
#Purpose: Remove all weaves by a player (including placed)
#Runner: The player whose weaves should be removed, run via power_handling/exit.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id
#Remember Temp reg_1 gets scratched
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 run tag @s add remove_cleanup_player_all_temp

execute as @e[tag=remove_cleanup_player_all_temp] run function magic:cleanup/remove_cleanup

tag @e remove remove_cleanup_player_all_temp

#This is needed as a fallback to remove the data from those not placed
#This and other things would not however detect moving a weave into something else, a dedicated function would need to keep track and dispose of that
execute store result storage magic:remove_cleanup_player_all_iteration index int 1 run scoreboard players get 0 reg_1
function magic:cleanup/remove_cleanup_player_all_iteration with storage magic:remove_cleanup_player_all_iteration