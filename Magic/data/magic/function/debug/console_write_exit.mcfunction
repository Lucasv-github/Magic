################################################################################
#Purpose: Send info that a player exited the power to the server console
#Runner: A player that exited the power, run via power_handling/exit.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"EXITED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Held: "},{score:{name:"@e[tag=current_player_for_log,limit=1]",objective:"current_held"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new