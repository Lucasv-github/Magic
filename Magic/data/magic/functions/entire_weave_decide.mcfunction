execute as @s[scores={reg_1=1}] run scoreboard players set @s air 1
execute as @s[scores={reg_1=2}] run scoreboard players set @s earth 2
execute as @s[scores={reg_1=3}] run scoreboard players set @s fire 3
execute as @s[scores={reg_1=4}] run scoreboard players set @s water 4
execute as @s[scores={reg_1=5}] run scoreboard players set @s spirit 5

execute as @s[scores={reg_1=1..}] run function magic:build