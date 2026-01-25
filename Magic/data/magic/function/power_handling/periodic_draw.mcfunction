################################################################################
#Purpose: Increase held power based on power adjustor
#Runner: Any player using magic, not holding their power adjustor, run via events/second.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s total_draw_amount -= @s current_draw
scoreboard players operation @s my_draw_amount -= @s current_draw

#In circle should also decrease every member when releasing
#Doing this the same way as @s my_draw_amount
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s current_draw
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 run scoreboard players operation @s my_draw_amount -= Temp reg_2


#Can't draw more even with one of these
execute as @s[tag=!welled] if score @s tap_block_percentage matches 1.. run return 0

#Eye count
execute store result score @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 0

scoreboard players operation @s reg_1 *= 100 reg_1
scoreboard players operation @s reg_1 /= 32 reg_1

scoreboard players operation @s reg_1 *= @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 100 reg_1

#Strength considerations
scoreboard players operation @s reg_2 = @s regenerated_strength
scoreboard players operation @s reg_2 *= 100 reg_1
scoreboard players operation @s reg_2 /= @s max_regenerated_strength

execute store result storage magic:math/get_strength index int 1 run scoreboard players get @s reg_2
function magic:math/get_strength with storage magic:math/get_strength

data remove storage magic:math/get_strength index

scoreboard players operation @s reg_1 *= Temp reg_1
scoreboard players operation @s reg_1 /= 100 reg_1

execute if score @s reg_1 matches ..0 run scoreboard players set @s reg_1 1

scoreboard players operation @s current_draw = @s reg_1

tag @s remove periodic_draw_block

execute as @s[tag=circle_owner,tag=!angreal_flawed] run tag @s add periodic_draw_block
execute as @s[tag=angrealed,tag=!angreal_flawed] run tag @s add periodic_draw_block

execute as @s[tag=periodic_draw_block] if score @s current_draw > @s cumulative_halve_amount_hold run scoreboard players operation @s current_draw = @s cumulative_halve_amount_hold

execute as @s[tag=periodic_draw_block] if score @s current_draw >= @s cumulative_halve_amount_hold run return 0


function magic:power_handling/delta_handle


#In circle should also decrease every member when releasing
#Doing this the same way as @s my_draw_amount
#This should be dublicated
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s current_draw
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 run scoreboard players operation @s my_draw_amount += Temp reg_2
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 if score @s my_draw_amount matches ..0 run scoreboard players set @s my_draw_amount 0

scoreboard players operation @s total_draw_amount += @s current_draw
scoreboard players operation @s my_draw_amount += @s current_draw

#Self draw
#Circled/Angreal prevents the problem of exponential growth

#At 1:1
#Self draw increase: 1
execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_draw > @s cumulative_halve_amount_hold run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

#At 2:1
#Self draw increase: 4
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_draw > @s reg_1 run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 4

#At 4:1
#Self draw decrease: -12 Makes it harder to blow up
#scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
#scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
#execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_draw > @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 12

#Lost hold of it
execute as @s[scores={current_draw=..0}] run function magic:power_handling/exit

#tellraw @a {"score":{"name":"@s","objective":"reg_1"}}