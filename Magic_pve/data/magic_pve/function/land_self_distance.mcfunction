#say land self

execute positioned ~ ~2 ~ run function magic:magic_actions/landed
tag @s remove magic_pve_action_left
tag @s remove magic_pve_self

function magic:weave_handling/new_weave