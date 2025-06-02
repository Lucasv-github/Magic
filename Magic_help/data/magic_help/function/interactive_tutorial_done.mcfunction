tag @s remove magic_help_interactive_tutorial_wait_kill_2
tag @s remove magic_help_interactive_tutorial

effect clear @s resistance
effect clear @s saturation

function magic_commons:teleport

execute at @s run playsound minecraft:entity.ender_dragon.death

tellraw @s ["",{text:"Congratulations on compleating the tutorial!",bold:true,color:"gold"},{text:"\n"},{text:"For a more comprehensive guide please visit: ",bold:true,color:"gold"},{text:"https://lucasv-github.github.io/Magic_website/",color:"blue",click_event:{action:"open_url",url:"https://lucasv-github.github.io/Magic_website/"}}]