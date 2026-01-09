################################################################################
#Purpose: Sets the fill data in an individual storage denoted by $(entity_id) from the argument $(argument)
#Runner: Any entity performing a safe fill, ran via fill_if_allowed.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

$data modify storage magic:fill_data_$(entity_id) argument set value "$(argument)"