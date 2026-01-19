################################################################################
#Purpose: Append player_weave_index specified by $(player_weave_index) into player specific weave copy storage specified by $(player_id)
#Useful when a player looses a weave and we need to delete its data
#Runner: A player adding an element to a weave without a weave in their build slot
#Return values:
#Authors: Lprogrammer
################################################################################

#$say Save $(player_weave_index) to $(player_id)

$data modify storage magic:player_$(player_id)_weaves Indexes append value $(player_weave_index)