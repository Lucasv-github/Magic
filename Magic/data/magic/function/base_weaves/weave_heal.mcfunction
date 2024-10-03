scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

execute as @e if score @s entity_id = Temp reg_1 run tag @s add heal_me

#Prevent self
execute if score @a[tag=heal_me,limit=1] player_id = @s player_id run tag @e remove heal_me

#Only if not max health
execute store result score Temp reg_1 run attribute @e[tag=heal_me,distance=..5,limit=1] generic.max_health get
execute store result score Temp reg_2 run data get entity @e[tag=heal_me,distance=..5,limit=1] Health
execute if score Temp reg_1 = Temp reg_2 run tag @e remove heal_me


#Need to be near player
scoreboard players operation Temp reg_1 = @s player_id
execute at @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

#Need to be near weave
execute unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

$effect give @e[tag=heal_me] minecraft:regeneration $(size) 2
$effect give @e[tag=heal_me,tag=!using] minecraft:hunger 1 $(size)
damage @e[tag=heal_me,limit=1] 0.01 minecraft:freeze

scoreboard players operation Remove_force reg_1 = @a[tag=heal_me,tag=using,tag=can_use,limit=1] halve_amount_hold
scoreboard players operation Remove_force reg_1 /= 10 reg_1
$scoreboard players add Remove_force reg_1 $(size)

execute as @a[tag=heal_me,tag=using,tag=can_use] run function magic:power_handling/remove_force_amount

tag @e remove heal_me
