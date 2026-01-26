################################################################################
#Purpose: Add specified weave element into weave specific storage, send messages back to player building weave and consume power
#Arguments @s reg_1 = element(air,earth,fire,water,spirit)
#Runner: An entity adding an element to a weave, run via weave_handling/add_element_pre.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Can only add element to weave in slot 9
#This function needs to be as stripped down as possible

execute at @s run playsound minecraft:entity.item.pickup player @s

scoreboard players add @s weave_length 1

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data

data remove storage magic:weave_storage_add_data index

function magic:magic_support/calculate_distance

execute as @s[scores={reg_1=-1}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"↓","color":"white"}]

execute as @s[scores={reg_1=1}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE000","color":"white","font":"magic_resourcepack:gui_font"}]
execute as @s[scores={reg_1=2}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE001","color":"white","font":"magic_resourcepack:gui_font"}]
execute as @s[scores={reg_1=3}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE002","color":"white","font":"magic_resourcepack:gui_font"}]
execute as @s[scores={reg_1=4}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE003","color":"white","font":"magic_resourcepack:gui_font"}]
execute as @s[scores={reg_1=5}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE004","color":"white","font":"magic_resourcepack:gui_font"}]

scoreboard players add @s current_drain 10

#Below bail for cleaner chat
tellraw @s ["",{"text":"","click_event":{"action":"run_command","command":"/trigger a set 1"},"font":"magic_resourcepack:gui_font"},{"text":" ","color":"gold"},{"text":"","click_event":{"action":"run_command","command":"/trigger e set 2"},"font":"magic_resourcepack:gui_font"},{"text":" ","color":"gold"},{"text":"","click_event":{"action":"run_command","command":"/trigger f set 3"},"font":"magic_resourcepack:gui_font"},{"text":" ","color":"gold"},{"text":"","click_event":{"action":"run_command","command":"/trigger w set 4"},"font":"magic_resourcepack:gui_font"},{"text":" ","color":"gold"},{"text":"","click_event":{"action":"run_command","command":"/trigger s set 5"},"font":"magic_resourcepack:gui_font"},{"text":" ","color":"gold"},{"text":" ↑ ","color":"black","click_event":{"action":"run_command","command":"/trigger state set 1"}}]

execute as @s[tag=!built] run function magic:weave_handling/new_weave

tag @s add built
tag @s add need_weave_flush