################################################################################
#Purpose: Remove the glass placed by an air box weave with the size $(size)
#Runner: The armorstand whose weave gets removed, via cleanup/remove_cleanup.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################
$execute at @s run fill ~-$(size) ~-$(size) ~-$(size) ~$(size) ~$(size) ~$(size) minecraft:air replace minecraft:glass