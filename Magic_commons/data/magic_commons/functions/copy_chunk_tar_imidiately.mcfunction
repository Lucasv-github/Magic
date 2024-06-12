#say imidiate copying

$execute unless entity @e[tag=tar_chunk_loaded_marker,name=X_$(x)Y_$(y)] in magic_commons:tar run forceload add $(x) $(y)

$execute positioned $(x) 100 $(y) in minecraft:overworld if loaded ~ ~ ~ run scoreboard players set Temp reg_3 1
$execute if score Temp reg_3 matches 0 positioned as @s in minecraft:overworld run forceload add $(x) $(y)

$execute positioned $(x) 100 $(y) in magic_commons:tar run clone from minecraft:overworld ~15 -64 ~15 ~ 319 ~ to magic_commons:tar ~ -64 ~
$execute if score Temp reg_3 matches 0 positioned $(x) 100 $(y) in minecraft:overworld run forceload remove ~ ~
$execute positioned $(x) 100 $(y) in magic_commons:tar run forceload remove ~ ~

#Need to be last
$execute unless entity @e[tag=tar_chunk_loaded_marker,name=X_$(x)Y_$(y)] in minecraft:overworld run summon minecraft:armor_stand 0 -80 0 {NoGravity:1b,Tags:["tar_chunk_loaded_marker"],CustomName:"X_$(x)Y_$(y)"}
$scoreboard players set @e[tag=tar_chunk_loaded_marker,name=X_$(x)Y_$(y),limit=1] player_id $(player_id)