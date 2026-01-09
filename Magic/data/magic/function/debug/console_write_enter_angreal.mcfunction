################################################################################
#Purpose: Send info that a player used an angreal to the server console
#Runner: A player that used an angreal, run via power_handling/enter_angreal.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"ANGREALED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Level: "},{score:{name:"@e[tag=current_player_for_log,limit=1]",objective:"angreal_level"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new