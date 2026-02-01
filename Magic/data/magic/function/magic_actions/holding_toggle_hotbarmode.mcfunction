################################################################################
#Purpose: Toggle hotbarmode and also correct mainhand and offhand by switching the items back
#Runner: A player who swapped their power into their offhand to toggle hotbarmode, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

function magic:inventory/swap_hands
function magic:magic_actions/toggle_hotbarmode