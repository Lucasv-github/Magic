scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

execute as @e if score @s entity_id = Temp reg_1 run tag @s add delve_me

#Prevent self
execute if score @a[tag=delve_me,limit=1] player_id = @s weave_owner_player_id run tag @e remove delve_me

execute at @s store result score Temp reg_2 run data get entity @e[tag=delve_me,distance=..5,limit=1] Health

scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute at @s if entity @e[tag=delve_me,distance=..5,limit=1] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run tellraw @s {score:{name:"Temp",objective:"reg_2"},bold:true,color:"gold"}

execute if score @s weave_delve_count matches 100.. at @s if entity @e[tag=delve_me,distance=..5,limit=1,tag=stilled] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run tellraw @s ["",{text:"~~~",bold:true,color:"gold"},{text:"\n"},{text:"   "},{text:"\n"},{text:"~~~",bold:true,color:"gold"}]
tag @e remove delve_me


