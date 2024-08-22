execute as @s[scores={reg_1=1}] run scoreboard players set @s a 1
execute as @s[scores={reg_1=2}] run scoreboard players set @s e 2
execute as @s[scores={reg_1=3}] run scoreboard players set @s f 3
execute as @s[scores={reg_1=4}] run scoreboard players set @s w 4
execute as @s[scores={reg_1=5}] run scoreboard players set @s s 5
execute as @s[scores={reg_1=6}] run function magic:add_line


execute as @s[scores={reg_1=1..}] run function magic:build