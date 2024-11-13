#Called once one open the power

tag @s add using

scoreboard players set @s angreal_level 1
scoreboard players set @s weave_length 0

#Need to be here
scoreboard players set @s current_held 0

#Prevent dual items when opening first time
execute as @s[tag=using] unless score @s use_items matches 0 run tag @s add barmode

#Angreal here already
scoreboard players set @s reg_1 0
scoreboard players set @s reg_2 0
execute as @s[tag=using,tag=can_use] store result score @s reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.Amplification
execute as @s[tag=using,tag=can_use] store result score @s reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Angreal_flawed
execute as @s[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:power_handling/enter_angreal

#Angreal offhand (want this to enter like in mainhand here)
scoreboard players set @s reg_1 0
scoreboard players set @s reg_2 0
execute as @s[tag=using,tag=can_use] store result score @s reg_1 run data get entity @s Inventory[{Slot:-106b}].components.minecraft:custom_data.Amplification
execute as @s[tag=using,tag=can_use] store result score @s reg_2 run data get entity @s Inventory[{Slot:-106b}].components.minecraft:custom_data.Angreal_flawed

execute as @s[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:swap_hands
execute as @s[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:power_handling/enter_angreal


#Give starting amount
scoreboard players set @s reg_1 110
scoreboard players operation @s reg_1 -= @s sneak_time
scoreboard players operation @s reg_1 *= @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 100 reg_1
scoreboard players operation Give_force reg_1 = @s reg_1
execute if score Give_force reg_1 matches ..10 run scoreboard players set Give_force reg_1 10
function magic:power_handling/give_force_amount


scoreboard players operation @s my_draw_amount = @s current_held
scoreboard players operation @s total_draw_amount = @s current_held

#Will exit if we are unable to tap
function magic:power_handling/tap_power

#Store this to make use easier
execute as @s[tag=using] run function magic:store_hotbar

scoreboard players set @s state 0

scoreboard players set @s a 0
scoreboard players set @s e 0
scoreboard players set @s f 0
scoreboard players set @s w 0
scoreboard players set @s s 0

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Air","italic":false,"color":"aqua"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=1,custom_data={Magic:1}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Earth","italic":false,"color":"dark_green"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=2,custom_data={Magic:2}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Fire","italic":false,"color":"red"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=3,custom_data={Magic:3}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Water","italic":false,"color":"dark_blue"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=4,custom_data={Magic:4}] 1

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Spirit","italic":false,"color":"white"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=5,custom_data={Magic:5}] 1

#32, perfectly balanced
give @s[tag=using] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Force","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power","italic":false}]'],custom_model_data=1,custom_data={Magic:6,Magic_preserve:1}] 32

#Needs to be below store hotbar as it adds item that shouldn't be stored
execute as @s[scores={sneak_time=100..}] run function magic:power_handling/create_circle_nearby

tellraw @s[tag=using] ["",{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" ↑ ","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}}]

#We can live with this collision risk
execute store result score @s player_weave_index run random value 0..2147483646

scoreboard players set @s sneak_time 0

tag @s[tag=using] add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_open
tag @s remove current_player_for_log