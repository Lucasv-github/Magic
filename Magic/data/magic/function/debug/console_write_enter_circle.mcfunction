################################################################################
#Purpose: Send info that a player entered a circle to the console
#Runner: A player that entered a circle, run via power_handling/enter_circle.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"CIRCLED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Owner: "},{score:{name:"@e[tag=current_player_for_log,limit=1]",objective:"circled_owner_id"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new