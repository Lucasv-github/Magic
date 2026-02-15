################################################################################
#Purpose: Gets run every fourth seconds
#Runner: Server, gets run via tick.mcfunction->second.mcfunction->fourth_sec.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @e[tag=using,scores={disguise=0}] run function magic:display/display_player_glow
