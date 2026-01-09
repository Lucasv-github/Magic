################################################################################
#Purpose: Will temporary restore the hotbar like without magic, by removing all magic interaction items exept weaves
#Runner: A player who should get their interaction items removed
#Return values:
#Authors: Lprogrammer
################################################################################

#Observe that a tick before inventory/restore_magic will cause the player to exit magic

function magic:magic_support/clear_magic_items
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}]

function magic:inventory/load_hotbar