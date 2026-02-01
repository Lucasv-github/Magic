################################################################################
#Purpose: Macroed fill command with arguments $(x_s) $(y_s) $(z_s) $(x_e) $(y_e) $(z_e) $(argument)
#Runner: A safe fill context armorstand which has proven the fill safety and ran via finalize_safe_fill.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#at @s to keep dimension context
$execute at @s run fill $(x_s) $(y_s) $(z_s) $(x_e) $(y_e) $(z_e) $(argument)