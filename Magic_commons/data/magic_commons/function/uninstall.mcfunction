tellraw @a {"text":"Uninstalling magic commons, observe that this will leave tags on unloaded entities","bold":true,"color":"dark_red"}

datapack disable "file/Magic_commons"

scoreboard objectives remove deaths
scoreboard objectives remove player_id
scoreboard objectives remove entity_id

tag @e remove join_ability_add
tag @e remove teleport_target
tag @e remove current_storage
tag @e remove current_withdraw
tag @e remove tar_chunk_loaded_not_copied
tag @e remove in_tar
tag @e remove enter_tar_using_temp
tag @e remove died_in_tar
tag @e remove tar_chunk_loaded_marker
tag @e remove actionbar_display_temp