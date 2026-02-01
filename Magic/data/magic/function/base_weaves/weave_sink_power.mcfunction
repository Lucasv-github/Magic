function magic:weave_handling/register_rest_draw

function magic:weave_handling/get_rest_draw
scoreboard players operation Temp reg_1 /= 10 reg_1
scoreboard players operation @s current_sink = Temp reg_1

tag @s add weave_sink_power
