################################################################################
#Purpose: Display the glow of a player that are using the power expect if they are disguised
#Runner: No entity, via events/fourth_sec.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s reg_1 = @s current_draw
scoreboard players operation @s reg_1 /= 10 reg_1
execute store result storage magic:display_player_glow_sub count int 1 run scoreboard players get @s reg_1
function magic:magic_support/calculate_distance
function magic:display/display_player_glow_sub with storage magic:display_player_glow_sub
