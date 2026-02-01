################################################################################
#Purpose: Remove player_weave_index specified Temp reg_1 from player specific weave copy storage specified by $(player_id), starting at $(i)
#Useful when tying off a weave to prevent illegal weave from triggering
#Arguments: Temp reg_1: player_weave_index 
#Runner: A player adding an element to a weave without a weave in their build slot
#Return values:
#Authors: Lprogrammer
################################################################################

#$say Save $(player_weave_index) to $(player_id)

$scoreboard players set Temp reg_2 $(i)

scoreboard players add Temp reg_2 1
execute store result storage magic:weave_copies_remove_index i int 1 run scoreboard players get Temp reg_2

scoreboard players set Temp reg_3 0
$execute store result score Temp reg_3 run data get storage magic:player_$(player_id)_weaves Indexes[$(i)]

$execute if score Temp reg_3 = Temp reg_1 run data remove storage magic:player_$(player_id)_weaves Indexes[$(i)]
execute unless score Temp reg_3 matches 0 unless score Temp reg_3 = Temp reg_1 run function magic:weave_handling/weave_copies_remove_index with storage magic:weave_copies_remove_index