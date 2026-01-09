################################################################################
#Purpose: Increase held power based on power adjustor
#Runner: Any player using magic, not holding their power adjustor, run via events/second.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Get positive/negative distance from 32
execute store result score @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 0

#Need old copy
scoreboard players operation @s reg_2 = @s reg_1

scoreboard players remove @s[scores={reg_2=32..}] reg_1 32
scoreboard players remove @s[scores={reg_2=..31}] reg_1 32

scoreboard players operation @s total_draw_amount -= @s current_held
scoreboard players operation @s my_draw_amount -= @s current_held

#In circle should also decrease every member when releasing
#Doing this the same way as @s my_draw_amount
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s current_held
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 run scoreboard players operation @s my_draw_amount -= Temp reg_2

#Increase/decreases
scoreboard players operation Draw_force reg_1 = @s reg_1
function magic:power_handling/draw_multiple

#In circle should also decrease every member when releasing
#Doing this the same way as @s my_draw_amount
#This should be dublicated
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s current_held
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 run scoreboard players operation @s my_draw_amount += Temp reg_2
execute as @s[scores={reg_1=..-1}] as @a[tag=can_use,tag=circled] if score @s circled_owner_id = Temp reg_1 if score @s my_draw_amount matches ..0 run scoreboard players set @s my_draw_amount 0

scoreboard players operation @s total_draw_amount += @s current_held
scoreboard players operation @s my_draw_amount += @s current_held

#Self draw
#Circled/Angreal prevents the problem of exponential growth

#At 1:1
#Self draw increase: 1
execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_held > @s cumulative_halve_amount_hold run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1}] 1

#At 2:1
#Self draw increase: 4
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_held > @s reg_1 run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1}] 4

#At 4:1
#Self draw decrease: -12 Makes it harder to blow up
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 += @s cumulative_halve_amount_hold
execute as @s[tag=!circle_owner,tag=!angrealed,scores={halve_amount_hold=10..}] if score @s current_held > @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}] 12

#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:power_handling/exit

#tellraw @a {"score":{"name":"@s","objective":"reg_1"}}