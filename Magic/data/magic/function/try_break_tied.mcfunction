tag @s add trying_to_break_free
tag @s add can_break_free

tellraw @a[tag=trying_to_break_free, limit=1] {"text":"----------","color":"gold"}

execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=0}] if score @s weave_locked_player_id = @a[tag=trying_to_break_free, limit=1] player_id run tellraw @a[tag=trying_to_break_free, limit=1] {"text":"~~","color":"gold"}
execute as @e[type=armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..,t_1=5,t_2=5,t_3=5,t_4=0}] if score @s weave_locked_player_id = @a[tag=trying_to_break_free, limit=1] player_id run tellraw @a[tag=trying_to_break_free, limit=1] {"text":"[]","color":"gold"}

execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] if score @s weave_locked_player_id = @a[tag=trying_to_break_free, limit=1] player_id run tellraw @a[tag=trying_to_break_free, limit=1] {"text":"~~","color":"gold"}
execute as @e[type=armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..,t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] if score @s weave_locked_player_id = @a[tag=trying_to_break_free, limit=1] player_id run tellraw @a[tag=trying_to_break_free, limit=1] {"text":"[]","color":"gold"}

tellraw @a[tag=trying_to_break_free, limit=1] {"text":"----------","color":"gold"}

tag @a remove trying_to_break_free