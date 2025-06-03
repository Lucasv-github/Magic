#Will temporary restore the hotbar like without magic
#Observe that a tick before inventory/restore_magic will cause the player to exit magic
#TODO this currently neither saves the weaves, nor the draw amount
#Need argument to save/load hotbar to utilize that and save a second hotbar copy

function magic:magic_support/clear_magic_items
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}]

function magic:inventory/load_hotbar