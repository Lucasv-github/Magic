#detect adam right click
execute as @a[scores={click=1..},tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic_ter_adam:0}] at @s run function magic_ter:adam

#detect adam bracelet right click
execute as @a[scores={click=1..},tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic_ter_adam:1}] at @s run function magic_ter:adam_reopen 

#Detect adam removal sneak time
execute as @a[scores={sneak_time=100}] at @s as @a[tag=damane,distance=..2] run function magic_ter:adam_exit

#Detect damane death
execute as @a[tag=damane,limit=1,scores={magic_ter_death=1}] run function magic_ter:adam_death

#Detect if damane picks up adam
execute as @a[tag=damane] store success score @s reg_1 run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic_ter_adam:1}] 0
execute as @a[tag=damane] if score @s reg_1 matches 1 run function magic_ter:adam_pain

#Detect if damane is channeling
execute as @a[tag=damane,tag=using] run function magic_ter:adam_pain


