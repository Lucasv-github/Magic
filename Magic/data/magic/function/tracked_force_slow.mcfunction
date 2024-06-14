execute as @s[tag=using,scores={current_held=3..}] run scoreboard players operation Temp reg_1 = @s player_id
execute as @s[tag=using,scores={current_held=3..}] run scoreboard players operation Temp reg_2 = @s slow_down
execute as @s[tag=using,scores={current_held=3..}] as @e[scores={finder_time=1..}] if score @s finder_owner_id = Temp reg_1 if score @s finder_index = Temp reg_2 run effect give @s[tag=!using] minecraft:slowness 10 3
execute as @s[tag=using,scores={current_held=3..}] run scoreboard players set @s slow_down 0
execute as @s[tag=using,scores={current_held=3..}] run scoreboard players remove @s current_held 3