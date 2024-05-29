#First factor in tiredness
scoreboard players operation @s reg_1 = @s regenerated_strength 
scoreboard players operation @s reg_1 *= 100 reg_1
scoreboard players operation @s reg_1 /= @s max_regenerated_strength
scoreboard players operation Draw_force reg_1 *= @s reg_1
scoreboard players operation Draw_force reg_1 /= 100 reg_1
execute if score Draw_force reg_1 matches 0 run scoreboard players set Draw_force reg_1 1

#Then limit draw multiple to halve_amount_hold/2 if eyes <64
execute store result score @s reg_1 run clear @s minecraft:ender_eye 0

scoreboard players operation @s reg_2 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_2 /= 2 reg_1
scoreboard players add @s reg_2 1

execute if score @s reg_1 matches ..64 if score Draw_force reg_1 > @s reg_2 run scoreboard players operation Draw_force reg_1 = @s reg_2

function magic:draw_ten

#At 1:1 give nausea
#Self draw increase: 1
execute as @s if score @s current_held > @s cumulative_halve_amount_hold run effect give @s minecraft:nausea 10

#At 2:1 give nausea vision + damage once
#Self draw increase: 4
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run effect clear @s[scores={progressive_shielded=0}] minecraft:nausea
execute as @s if score @s current_held > @s reg_1 run effect give @s[scores={progressive_shielded=0}] minecraft:night_vision 10
execute as @s if score @s current_held > @s reg_1 run damage @s[scores={progressive_shielded=0},tag=!circle_owner,tag=!angrealed] 1

#At 3:1 give invurnability#At 1:1 give nausea
#Self draw increase: 1
execute as @s if score @s current_held > @s cumulative_halve_amount_hold run effect give @s minecraft:nausea 10

#At 2:1 give nausea vision + damage once
#Self draw increase: 4
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run effect clear @s[scores={progressive_shielded=0}] minecraft:nausea
execute as @s if score @s current_held > @s reg_1 run effect give @s[scores={progressive_shielded=0}] minecraft:night_vision 10
execute as @s if score @s current_held > @s reg_1 run damage @s[scores={progressive_shielded=0},tag=!circle_owner,tag=!angrealed] 1

#At 3:1 give invurnability
#Self draw increase: 16
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run effect give @s[scores={progressive_shielded=0}] minecraft:resistance 10 255

#At 4:1 Remove ability next time used (if not circled)
#Self draw increase: 64
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run tag @s[tag=!circle_owner, tag=!angrealed,scores={progressive_shielded=0}] add next_sever

#At 16:1 It is over
scoreboard players operation @s reg_1 *= 4 reg_1
execute as @s[tag=!circled, tag=!circle_owner,tag=!angrealed,scores={progressive_shielded=0}] if score @s current_held > @s reg_1 run scoreboard players operation @s doomed = @s current_held
execute as @s[tag=!circled, tag=!circle_owner,tag=!angrealed,scores={progressive_shielded=0}] if score @s current_held > @s reg_1 run function magic:exit

#Just limit (will be used if progressive shield is used)
execute as @s if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s reg_1
#Self draw increase: 16
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run effect give @s[scores={progressive_shielded=0}] minecraft:resistance 10 255

#At 4:1 Remove ability next time used (if not circled)
#Self draw increase: 64
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s if score @s current_held > @s reg_1 run tag @s[tag=!circle_owner, tag=!angrealed,scores={progressive_shielded=0}] add next_sever

#At 16:1 It is over
scoreboard players operation @s reg_1 *= 4 reg_1
execute as @s[tag=!circled, tag=!circle_owner,tag=!angrealed,scores={progressive_shielded=0}] if score @s current_held > @s reg_1 run scoreboard players operation @s doomed = @s current_held
execute as @s[tag=!circled, tag=!circle_owner,tag=!angrealed,scores={progressive_shielded=0}] if score @s current_held > @s reg_1 run function magic:exit

#Just limit (will be used if progressive shield is used)
execute as @s if score @s current_held > @s reg_1 run scoreboard players operation @s current_held = @s reg_1