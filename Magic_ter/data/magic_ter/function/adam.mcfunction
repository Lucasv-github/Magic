################################################################################
#Purpose: forces nearby player to enter a circle with @s and places the adam collar on them
#Runner: player using the adam item
#Return values:
#Authors: Boblegrob & Lprogrammer
################################################################################

scoreboard players set @s click 0

#Tags and check for success
tag @s add force_circle_owner_temp
execute store success score Temp reg_1 at @s run tag @a[distance=..2,tag=can_use,tag=!force_circle_owner_temp,tag=!circled,limit=1] add damane_temp

#Create damane shield
summon minecraft:armor_stand ~ ~ ~ {Tags:["target_point","actively_held","shield_locked","damane_shield"],NoGravity:1b,Invulnerable:1b,Invisible:1b,Marker:1b} 
scoreboard players operation @n[type=minecraft:armor_stand,tag=damane_shield] weave_locked_entity_id = @a[tag=damane_temp] entity_id
scoreboard players operation @n[type=minecraft:armor_stand] shield_lower_amount = @a[tag=damane_temp] halve_amount_hold
scoreboard players operation @n[type=minecraft:armor_stand] shield_lower_amount /= 10 reg_1
scoreboard players operation @n[type=minecraft:armor_stand] shield_lower_amount *= 9 reg_1
execute as @n[type=armor_stand,tag=damane_shield] in minecraft:overworld run tp @s 0 -80 0

#Texture change & more tags if succeeded
execute if score Temp reg_1 matches 1 run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:item_model":"magic_resourcepack:adam_bracelet","minecraft:custom_data":{"Magic_ter_adam":1}}}

#Bind damane player id to adam
execute store result storage magic_ter:damane_id player_id int 1 run scoreboard players get @a[tag=damane_temp,limit=1] player_id
item modify entity @s weapon.mainhand {"function":"minecraft:copy_custom_data","source":{"type":"minecraft:storage","source":"magic_ter:damane_id"},"ops":[{"source":"player_id","target":"player_id","op":"replace"}]}
data remove storage magic_ter:damane_id player_id

execute as @a[tag=damane_temp] run function magic:power_handling/force_circle

#Save helmet if target is wearing one
execute at @a[tag=damane_temp] if items entity @a[tag=damane_temp] armor.head * run summon item ~ ~ ~ {Item:{id:stick,count:1,components:{custom_data:{Magic_ter_adam:dropped}}}}
item replace entity @e[type=item,limit=1,nbt={Item:{components:{"minecraft:custom_data":{Magic_ter_adam:dropped}}}}] container.0 from entity @a[tag=damane_temp,limit=1] armor.head

#Force damane to wear the a'dam
item replace entity @a[tag=damane_temp,limit=1] armor.head with iron_trapdoor[custom_name=[{"text":"a'dam","italic":false}],enchantment_glint_override=false,enchantments={binding_curse:1},item_model="magic_resourcepack:adam_collar",custom_data={Magic_ter_adam:collar},tooltip_display={hidden_components:[enchantments]}]

#Even more tags
tag @a[tag=damane_temp] add damane
tag @a remove damane_temp
tag @s remove force_circle_owner_temp




