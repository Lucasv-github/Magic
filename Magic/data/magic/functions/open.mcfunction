#Called once one open the power

scoreboard players set @s angreal_level 1

#Prevent dual items when opening first time
execute as @s unless score @s use_items matches 0 run tag @s add barmode

#Store this to make use easier
function magic:store_hotbar

tellraw @s ["",{"text":"###","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":" ","color":"aqua"},{"text":"###","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":" ","color":"dark_green"},{"text":"###","color":"red","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":" ","color":"red"},{"text":"###","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":" ","color":"dark_blue"},{"text":"###","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" "},{"text":"->","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}},{"text":" ","color":"black"},{"text":"[]","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 2"}},{"text":" ","color":"black"},{"text":"X","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 4"}},{"text":" ","color":"black"},{"text":"<-","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 3"}}]

scoreboard players set @s open 0

scoreboard players set @s player_weave_index 1
scoreboard players operation @s player_weave_index_current = @s player_weave_index

scoreboard players set @s stage 0
scoreboard players set @s state 0

scoreboard players set @s a 0
scoreboard players set @s e 0
scoreboard players set @s f 0
scoreboard players set @s w 0
scoreboard players set @s s 0

give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:1,display:{Name:'[{"text":"Air","italic":false,"color":"aqua"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:1} 1

give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:2,display:{Name:'[{"text":"Earth","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:2} 1

give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:3,display:{Name:'[{"text":"Fire","italic":false,"color":"red"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:3} 1

give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:4,display:{Name:'[{"text":"Water","italic":false,"color":"dark_blue"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:4} 1

give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:5,display:{Name:'[{"text":"Spirit","italic":false,"color":"white"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:5} 1

#32, perfectly balanced
give @s minecraft:ender_eye{CustomModelData:0,display:{Name:'[{"text":"Force","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:6} 32


#Open with a start amount of power based on (sneaktime)*halve_amount_hold/50
scoreboard players set @s current_held 0

scoreboard players operation @s reg_1 = @s sneak_time
scoreboard players operation @s reg_1 *= @s halve_amount_hold
scoreboard players operation @s reg_1 /= 50 reg_1
scoreboard players operation Give_force reg_1 = @s reg_1
scoreboard players add Give_force reg_1 1
function magic:give_force_amount_consume



scoreboard players set @s sneak_time 0

tag @s add using


#Reset weave
scoreboard players set @s t_1 0
scoreboard players set @s t_2 0
scoreboard players set @s t_3 0
scoreboard players set @s t_4 0
scoreboard players set @s t_5 0
scoreboard players set @s t_6 0
scoreboard players set @s t_7 0
scoreboard players set @s t_8 0
scoreboard players set @s t_9 0
scoreboard players set @s t_10 0
scoreboard players set @s t_11 0
scoreboard players set @s t_12 0
scoreboard players set @s t_13 0
scoreboard players set @s t_14 0
scoreboard players set @s t_15 0
scoreboard players set @s t_16 0
scoreboard players set @s t_17 0
scoreboard players set @s t_18 0
scoreboard players set @s t_19 0
scoreboard players set @s t_20 0

tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:console_write_open
tag @s remove current_player_for_log