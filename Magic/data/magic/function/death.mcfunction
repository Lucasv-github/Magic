#say AAA

execute at @s if dimension magic_commons:tar run tag @s add died_in_tar

execute at @s run function magic:drop_hotbar
execute as @s[tag=circle_owner] run function magic:remove_circle
scoreboard players operation Temp reg_1 = @s circled_owner_id
execute as @s[tag=circled] as @a[tag=circle_owner,tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:remove_circle
tag @s remove circled
scoreboard players set @s death_detect 0
scoreboard players set @s doomed 0