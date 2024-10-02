tag @s add console_writer_current_weave

summon text_display ~ ~ ~ {Tags:["console_write_composition_temp"],text:'["","Owner: ",{"score":{"name":"@e[tag=console_writer_current_weave,limit=1]","objective":"player_id"}}," Locked: ",{"score":{"name":"@e[tag=console_writer_current_weave,limit=1]","objective":"weave_locked_player_id"}},{"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":""}]'}

tag @s remove console_writer_current_weave

execute in minecraft:overworld run summon armor_stand 0 0 0 {Tags:["console_writer_new"]}
execute in minecraft:overworld positioned 0 0 0 run data modify entity @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=console_writer_new] CustomName set from entity @e[limit=1,tag=console_write_composition_temp] text
tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new

kill @e[tag=console_write_composition_temp]