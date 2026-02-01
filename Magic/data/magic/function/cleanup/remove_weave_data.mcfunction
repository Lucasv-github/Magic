################################################################################
#Purpose: Remove weave data specified by $(index)
#Runner: Entity to get success state
#Return values: @s reg_1: removed_something
#Authors: Lprogrammer
################################################################################

#$say remove weave data $(index)

$execute store success score @s reg_1 run data remove storage magic:weave_$(index) Elements

$data remove storage magic:weave_$(index) Air
$data remove storage magic:weave_$(index) Earth
$data remove storage magic:weave_$(index) Fire
$data remove storage magic:weave_$(index) Water
$data remove storage magic:weave_$(index) Spirit