################################################################################
#Purpose: Convert the newline from build input value: (6) to weave storage value: (-1)
#Runner: An entity that has inputed a weave with /trigger built set, run via tick.mcfunction->weave_handeling/entire_weave.mcfunction->weave_handeling/entire_weave_decide.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s reg_2 = @s reg_1

#Only difference
execute as @s[scores={reg_1=6}] run scoreboard players set @s reg_1 -1

execute as @s[scores={reg_2=1..},tag=using] run function magic:weave_handling/add_element