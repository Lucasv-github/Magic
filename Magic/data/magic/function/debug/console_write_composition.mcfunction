tag @s add console_writer_current_weave

#We do not want to scratch Temp reg_1 here
execute as @e[tag=using,tag=can_use] if score @s player_id = @e[tag=console_writer_current_weave,limit=1] weave_owner_player_id run tag @s add current_player_for_log

#We do not want to scratch Temp reg_1 here
execute as @e if score @s entity_id = @e[tag=console_writer_current_weave,limit=1] weave_locked_entity_id run tag @s add console_writer_current_weave_locked

summon text_display ~ ~ ~ {Tags:["console_write_composition_temp"],text:'["","WEAVE: ",{"selector":"@e[tag=current_player_for_log,limit=1]"}," Locked: ",{"selector":"@e[tag=console_writer_current_weave_locked,limit=1]"}," Data: ",{"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:elements"}]',alignment:"left"}

tag @e remove current_player_for_log
tag @s remove console_writer_current_weave
tag @e remove console_writer_current_weave_locked

execute in minecraft:overworld run summon armor_stand 0 0 0 {Tags:["console_writer_new"]}
execute in minecraft:overworld positioned 0 0 0 run data modify entity @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=console_writer_new] CustomName set from entity @e[limit=1,tag=console_write_composition_temp] text
tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new

kill @e[tag=console_write_composition_temp]