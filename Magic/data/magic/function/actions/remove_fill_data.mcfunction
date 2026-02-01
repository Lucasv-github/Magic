################################################################################
#Purpose: Remove the fill data from a indididual storage denoted by $(entity_id)
#Runner: Doesn't matter
#Return values:
#Authors: Lprogrammer
################################################################################

$data modify storage magic:finalize_safe_fill_sub argument set from storage magic:fill_data_$(entity_id) argument

$data remove storage magic:fill_data_$(entity_id) argument