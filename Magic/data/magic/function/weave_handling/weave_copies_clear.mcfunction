################################################################################
#Purpose: Clear a player specific weave copy storage specified by $(player_id)
#Runner: A player whose copied weaves should be cleared, via power_handling/exit.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

$data remove storage magic:player_$(player_id)_weaves Indexes