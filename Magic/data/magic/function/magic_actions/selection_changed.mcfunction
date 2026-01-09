################################################################################
#Purpose: Add components to a weave based on which new hotbarslot is selected
#Runner: A player selecting a new hotbarslot with autobuilt set to true, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @s[scores={reg_1=0}] run scoreboard players set @s a 1
execute as @s[scores={reg_1=1}] run scoreboard players set @s e 1
execute as @s[scores={reg_1=2}] run scoreboard players set @s f 1
execute as @s[scores={reg_1=3}] run scoreboard players set @s w 1
execute as @s[scores={reg_1=4}] run scoreboard players set @s s 1

scoreboard players operation @s hotbar_current = @s reg_1