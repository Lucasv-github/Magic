function magic:power_handling/exit
scoreboard players set @s sneak_time 20
function magic:power_handling/open

tellraw @p {text:"You are holding too much power. Luckily this is a tutorial and nothing bad happened...",bold:true,color:"dark_red"}