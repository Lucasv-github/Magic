################################################################################
#Purpose: Remove the glass placed by a bridge weave with the element size $(size)
#Runner: The armorstands placed on the bridge, corresponding to a weave gets removed, via cleanup/remove_cleanup.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################
$execute at @s run fill ~$(size) ~ ~$(size) ~-$(size) ~ ~-$(size) minecraft:air replace minecraft:glass
kill @s