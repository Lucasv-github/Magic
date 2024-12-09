scoreboard players operation @s reg_1 = @s current_held
scoreboard players operation @s reg_1 /= 10 reg_1
execute store result storage magic:display_player_glow count int 1 run scoreboard players get @s reg_1
function magic:magic_support/calculate_distance
function magic:display/display_player_glow with storage magic:display_player_glow
