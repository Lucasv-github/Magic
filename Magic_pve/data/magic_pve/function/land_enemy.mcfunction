#say land enemy

function magic:magic_actions/landed
tag @s remove magic_pve_action_left
tag @s remove magic_pve_opponent

function magic:weave_handling/new_weave