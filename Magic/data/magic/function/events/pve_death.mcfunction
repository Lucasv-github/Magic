################################################################################
#Purpose: Gets run whenever a pve entity dies
#Runner: The inventory minecart belonging to the now dead pve entity, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

say PVE death

#We want to spill out the weaves to clean them up
scoreboard players operation Temp reg_1 = @s magic_pve_owner_entity_id
execute as @e[type=minecraft:chest_minecart,tag=magic_pve_inventory] if score @s magic_pve_owner_entity_id = Temp reg_1 run kill @s

kill @s