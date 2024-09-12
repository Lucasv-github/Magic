#Can only add element to weave in slot 9
#This function needs to be as stripped down as possible

execute at @s run playsound minecraft:entity.item.pickup player @s

scoreboard players add @s weave_length 1

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data

function magic:calculate_distance

execute as @s[scores={reg_1=1, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" \uE000","color":"white"}]
execute as @s[scores={reg_1=2, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" \uE001","color":"white"}]
execute as @s[scores={reg_1=3, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" \uE002","color":"white"}]
execute as @s[scores={reg_1=4, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" \uE003","color":"white"}]
execute as @s[scores={reg_1=5, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"weave_length"}},{"text":" \uE004","color":"white"}]


tellraw @s ["",{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" ↑ ","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}}]

#tellraw @s ["",{"text":"###","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":" ","color":"aqua"},{"text":"###","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":" ","color":"dark_green"},{"text":"###","color":"red","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":" ","color":"red"},{"text":"###","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":" ","color":"dark_blue"},{"text":"###","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" "}]

scoreboard players remove @s current_held 10
#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:power_handling/exit

tag @s add built
tag @s add need_weave_flush