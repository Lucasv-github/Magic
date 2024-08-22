scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute as @a if score @s entity_id = Temp reg_1 run tag @s add heal_me

#Prevent self
execute if score Temp reg_1 = @s entity_id run tag @a remove heal_me

$effect give @e[tag=heal_me] minecraft:regeneration $(size) 2
$effect give @e[tag=heal_me,tag=!using] minecraft:hunger 1 $(size)

scoreboard players operation Remove_force reg_1 = @a[tag=heal_me,tag=using,tag=can_use,limit=1] halve_amount_hold
scoreboard players operation Remove_force reg_1 /= 10 reg_1
$scoreboard players add Remove_force reg_1 $(size)

execute as @a[tag=heal_me,tag=using,tag=can_use] run function magic:remove_force_amount

tag @a remove heal_me