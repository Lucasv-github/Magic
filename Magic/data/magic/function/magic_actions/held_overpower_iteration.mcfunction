################################################################################
#Purpose: Remove held power from the owning entity of actively held shield weave
#Runner: An armorstand holding a shield weave
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @s[tag=!tied_off] as @e[tag=using,tag=can_use] if score @s entity_id = Temp reg_1 run scoreboard players operation @s current_held -= Temp reg_2