scoreboard players operation Temp reg_1 = @s weave_locked_player_id

execute at @s as @a[tag=using,distance=..50] if score @s player_id = Temp reg_1 run function magic:stun