#say WBR

tag @s add weave_balefire_ray_temp_works

scoreboard players set @s weave_balefire_ray_count 0

execute as @s[scores={weave_read_index=1..}] run function magic:base_weaves/weave_balefire_ray_iteration with storage magic:weave_size

scoreboard players operation Temp Balefire_ray_data = @s weave_balefire_ray_count
scoreboard players operation Temp Balefire_ray_data *= 10 reg_1
scoreboard players operation Temp reg_2 = @s weave_owner_player_id

execute at @s[tag=weave_balefire_ray_temp_works] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run function magic:weave_actions/balefire_ray with storage magic:weave_size


tag @s add weave_damaged
tag @s remove weave_balefire_ray_temp_works