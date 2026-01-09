################################################################################
#Purpose: Entry point to teleport an entity to destination_x, destination_y, destination_z
#Runner: Ran by the entity to be teleported
#Return values:
#Authors: Lprogrammer
################################################################################

tag @s add teleport_target
#Summon entity to be teleported to
execute summon minecraft:armor_stand run function magic:actions/teleport_entity