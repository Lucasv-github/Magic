execute in minecraft:overworld run setblock 0 0 0 oak_sign{front_text:{messages:['["ANGREALED: ",{"selector":"@e[tag=current_player_for_log,limit=1]"}," Level: ",{"score":{"name":"@e[tag=current_player_for_log,limit=1]","objective":"angreal_level"}}]','{"text":""}','{"text":""}','{"text":""}']}} destroy
execute in minecraft:overworld run summon armor_stand 0 0 0 {Tags:["console_writer_new"]}
execute in minecraft:overworld positioned 0 0 0 run data modify entity @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=console_writer_new] CustomName set from block 0 0 0 front_text.messages[0]
tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new