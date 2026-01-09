################################################################################
#Purpose: Send info that a player opened the power to the server console
#Runner: A player that opened the power, run via power_handling/open.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"OPENED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Held: "},{score:{name:"@e[tag=current_player_for_log,limit=1]",objective:"current_held"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new