scoreboard players operation @s reg_2 = @s reg_1

#Only difference
execute as @s[scores={reg_1=6}] run scoreboard players set @s reg_1 -1

execute as @s[scores={reg_2=1..}] run function magic:weave_handling/add_element