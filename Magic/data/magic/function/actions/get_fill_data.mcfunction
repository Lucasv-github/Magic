################################################################################
#Purpose: Moves the fill data from a indididual storage denoted by $(entity_id) into the common storage magic:finalize_safe_fill_sub and then deletes the individual storage
#Runner: Doesn't matter, run via finalize_safe_fill.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

$data modify storage magic:finalize_safe_fill_sub argument set from storage magic:fill_data_$(entity_id) argument

$data remove storage magic:fill_data_$(entity_id) argument