tag @s add weave_fire_ray_temp_works

scoreboard players set @s weave_fire_ray_count 0

execute as @s[scores={weave_read_index=1..}] run function magic:base_weaves/weave_fire_ray_iteration with storage magic:weave_size

scoreboard players operation Temp reg_1 = @s weave_fire_ray_count
scoreboard players operation Temp reg_2 = @s player_id

execute at @s[tag=weave_fire_ray_temp_works] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run function magic:fire_ray with storage magic:weave_size

tag @s remove weave_fire_ray_temp_works