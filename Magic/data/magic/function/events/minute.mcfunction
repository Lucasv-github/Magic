################################################################################
#Purpose: Gets run every minute
#Runner: Server, gets run via tick.mcfunction->second.mcfunction->minute.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @a[tag=can_use,tag=!using,tag=!circled] run function magic:magic_actions/regenerate_strength_once
