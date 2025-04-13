execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:"WELLED: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Current: "},{score:{name:"@e[tag=current_player_for_log,limit=1]",objective:"well_amount"}}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new