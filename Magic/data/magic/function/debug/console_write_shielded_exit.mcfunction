################################################################################
#Purpose: Send info that a player was blocked from using the power by a shield to server console
#Runner: A player that exited the power, run via power_handling/exit.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @e[tag=current_player_for_log,limit=1] entity_id
function magic_commons:hooks/get_shielded_lower

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"SHIELD BLOCKED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Lower amount: "},{score:{name:"Temp",objective:"reg_1"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new