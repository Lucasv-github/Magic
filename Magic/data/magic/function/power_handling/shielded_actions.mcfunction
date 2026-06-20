################################################################################
#Purpose: Run actions that can be taken when shielded selected based on sneak time
#Runner: An entity opening the power while shielded, via power_handling/open.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @s[scores={sneak_time=..20,regenerated_strength=1..}] run function magic:magic_actions/tied_shield_unknot
execute as @s[scores={sneak_time=..100,regenerated_strength=1..}] run function magic:display/display_shields
execute as @s[scores={sneak_time=100..,regenerated_strength=1..}] run function magic:display/display_shields_change
execute as @s[scores={sneak_time=..20,regenerated_strength=1..}] run function magic:magic_actions/held_overpower