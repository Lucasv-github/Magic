#say land enemy

#-1 to prevent blocking interactions
execute positioned ~ ~-1 ~ run function magic:magic_actions/landed
tag @s remove magic_pve_action_left
tag @s remove magic_pve_opponent

function magic:weave_handling/new_weave