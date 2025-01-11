#Can only add element to weave in slot 9
#This function needs to be as stripped down as possible

execute at @s run playsound minecraft:entity.item.pickup player @s

scoreboard players add @s weave_length 1

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data

function magic:magic_support/calculate_distance

execute as @s[scores={reg_1=1}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE000","color":"white","font":"magic_resourcepack:elements"}]
execute as @s[scores={reg_1=2}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE001","color":"white","font":"magic_resourcepack:elements"}]
execute as @s[scores={reg_1=3}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE002","color":"white","font":"magic_resourcepack:elements"}]
execute as @s[scores={reg_1=4}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE003","color":"white","font":"magic_resourcepack:elements"}]
execute as @s[scores={reg_1=5}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" ","color":"gold"},{"text":"\uE004","color":"white","font":"magic_resourcepack:elements"}]


tellraw @s ["",{"text":"","clickEvent":{"action":"run_command","value":"/trigger a set 1"},"font":"magic_resourcepack:elements"},{"text":" ","color":"gold"},{"text":"","clickEvent":{"action":"run_command","value":"/trigger e set 2"},"font":"magic_resourcepack:elements"},{"text":" ","color":"gold"},{"text":"","clickEvent":{"action":"run_command","value":"/trigger f set 3"},"font":"magic_resourcepack:elements"},{"text":" ","color":"gold"},{"text":"","clickEvent":{"action":"run_command","value":"/trigger w set 4"},"font":"magic_resourcepack:elements"},{"text":" ","color":"gold"},{"text":"","clickEvent":{"action":"run_command","value":"/trigger s set 5"},"font":"magic_resourcepack:elements"},{"text":" ","color":"gold"},{"text":" ↑ ","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}}]

scoreboard players remove @s current_held 10
#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:power_handling/exit

tag @s add built
tag @s add need_weave_flush