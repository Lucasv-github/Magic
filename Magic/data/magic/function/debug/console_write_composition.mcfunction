################################################################################
#Purpose: Send the composition of a weave to the server console
#Runner: An armorstand holding a weave, run via display/print_weave_composition_iteration.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

tag @s add console_writer_current_weave

#We do not want to scratch Temp reg_1 here
execute as @e[tag=using,tag=can_use] if score @s player_id = @e[tag=console_writer_current_weave,limit=1] weave_owner_player_id run tag @s add current_player_for_log

#We do not want to scratch Temp reg_1 here
execute as @e if score @s entity_id = @e[tag=console_writer_current_weave,limit=1] weave_locked_entity_id run tag @s add console_writer_current_weave_locked

execute in minecraft:overworld positioned 0 0 0 run summon minecraft:text_display ~ ~ ~ {Tags:["console_writer_new"],text:["",{text:" WEAVE: "},{selector:"@e[tag=current_player_for_log,limit=1]"},{text:" Locked: "},{selector:"@e[tag=console_writer_current_weave_locked,limit=1]"},{text:" Data: "},{"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:gui_font"}]}
execute in minecraft:overworld positioned 0 0 0 as @e[limit=1,sort=nearest,type=minecraft:text_display,tag=console_writer_new] run data modify entity @s CustomName set from entity @s text

tag @e remove current_player_for_log
tag @s remove console_writer_current_weave
tag @e remove console_writer_current_weave_locked

tag @e[tag=console_writer_new] add console_writer
tag @e[tag=console_writer_new] remove console_writer_new