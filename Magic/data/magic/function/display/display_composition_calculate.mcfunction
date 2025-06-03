function magic:magic_support/calculate_distance

#Remove truly_see from all but self if inverted
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see

scoreboard players set Temp reg_1 0
function magic:display/print_weave_composition