#First factor in tiredness
scoreboard players operation @s reg_1 = @s regenerated_strength

#Try to reduce low strength effects a bit
scoreboard players operation @s reg_1 *= 2 reg_1
execute if score @s reg_1 > @s regenerated_strength run scoreboard players operation @s reg_1 = @s regenerated_strength

#Doing this z=(x/(y/100)) instead of z=(x*100/y) to try to prevent hitting int limit
scoreboard players operation @s reg_2 = @s max_regenerated_strength
scoreboard players operation @s reg_2 /= 100 reg_1

scoreboard players operation @s reg_1 /= @s reg_2

scoreboard players operation Draw_force reg_1 *= @s reg_1
scoreboard players operation Draw_force reg_1 /= 100 reg_1

#tellraw @p {"score":{"name":"Draw_force","objective":"reg_1"}}

execute if score Draw_force reg_1 matches 0 run scoreboard players set Draw_force reg_1 1

#Then limit draw multiple to halve_amount_hold/2 if eyes <64
execute store result score @s reg_1 run clear @s minecraft:ender_eye[custom_data~{Force:6}] 0

scoreboard players operation @s reg_2 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_2 /= 2 reg_1
scoreboard players add @s reg_2 1

execute if score @s reg_1 matches ..64 if score Draw_force reg_1 > @s reg_2 run scoreboard players operation Draw_force reg_1 = @s reg_2

function magic:draw_ten