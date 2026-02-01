#$say $(x)
#$say $(y)

$execute unless entity @e[tag=tar_chunk_loaded_marker,tag=X_$(x)Y_$(y)] in magic_commons:tar run summon minecraft:armor_stand $(x) 100 $(y) {NoGravity:1b,Tags:["tar_chunk_loaded_not_copied"]}
$execute unless entity @e[tag=tar_chunk_loaded_marker,tag=X_$(x)Y_$(y)] in magic_commons:tar run forceload add $(x) $(y)

#Need to be last
$execute unless entity @e[tag=tar_chunk_loaded_marker,tag=X_$(x)Y_$(y)] in minecraft:overworld run summon minecraft:armor_stand 0 -80 0 {NoGravity:1b,Tags:["tar_chunk_loaded_marker","X_$(x)Y_$(y)"],CustomName:"X_$(x)Y_$(y)"}
$scoreboard players set @e[tag=tar_chunk_loaded_marker,tag=X_$(x)Y_$(y),limit=1] player_id $(player_id)
