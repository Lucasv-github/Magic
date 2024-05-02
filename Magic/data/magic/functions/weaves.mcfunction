tag @s add current_weave_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:console_write_executed
tag @s remove current_weave_for_log

tag @s add current_target

function magic:calculate_distance

execute at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] ["",{"score":{"name":"@s","objective":"current_held"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_x"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_y"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_z"},"color":"gold"}]

#Remove truly_see from all but self if inverted
scoreboard players operation Temp reg_1 = @s player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see

execute at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] ["",{"score":{"name":"@s","objective":"current_held"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_x"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_y"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_z"},"color":"gold"},{"text":"****","color":"gold"}]

function magic:display_composition

function magic:print_composition

#Weaves directed at a person will be locked directly when it land and can be accesed with weave_execute_id

tag @s[tag=current_target,tag=unused] add hold_used

#Lightning FAF
execute at @s[tag=current_target,scores={t_1=3,t_2=1,t_3=3,t_4=0}] run summon minecraft:lightning_bolt
execute at @s[tag=current_target,scores={t_1=3,t_2=1,t_3=3,t_4=0}] run tag @s add weave_damaged

#Big lightning FFAFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=0}] run summon minecraft:lightning_bolt
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=0}] as @e[distance=..5] run damage @s 20 minecraft:lightning_bolt
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=0}] run tag @s add weave_damaged


#Fireball FFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:2,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=0}] run tag @s add weave_damaged

#Fireball FF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:2}

#Small explosion EFE
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=0}] run summon tnt ~ ~1 ~
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=0}] run tag @s add weave_damaged

#Medium explosion EFEF
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=3,t_5=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:4,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=3,t_5=0}] run tag @s add weave_damaged

#Medium+ explosion EFEFF
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=3,t_5=3,t_6=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:6,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=3,t_5=3,t_6=0}] run tag @s add weave_damaged

#Large explosion EFEFFF
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_2=3,t_4=3, t_4=3, t_6=3, t_7=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:10,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_2=3,t_4=3, t_4=3, t_6=3, t_7=0}] run tag @s add weave_damaged

#Large explosion EFEEFEFFF
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=2, t_5=3, t_6=2, t_7=3,t_8=3,t_9=3, t_10=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:20,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=2, t_5=3, t_6=2, t_7=3,t_8=3,t_9=3, t_10=0}] run tag @s add weave_damaged

#Large explosion EFEEFEEFEFFF
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=2, t_5=3, t_6=2, t_7=2,t_8=3,t_9=2, t_10=3, t_11=3,t_12=3, t_13=0}] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:40,Motion:[0.0,-10.0,0.0]}
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=2,t_4=2, t_5=3, t_6=2, t_7=2,t_8=3,t_9=2, t_10=3, t_11=3,t_12=3, t_13=0}] run tag @s add weave_damaged

#Small f F
execute at @s[tag=current_target,scores={t_1=3,t_2=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:fire replace minecraft:air


#Large f FFFFFFFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=3,t_7=3,t_8=3,t_9=0}] run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 minecraft:fire replace minecraft:air

#Fire ray continue FFFFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=0}] run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:fire replace minecraft:air
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=0}] as @e[distance=..4] run damage @s 10 minecraft:in_fire

#Large Extinguish WWFWW
execute at @s[tag=current_target,scores={t_1=4,t_2=4,t_3=3,t_4=4,t_5=4,t_6=0}] run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 minecraft:air replace minecraft:fire

#Small w W
execute at @s[tag=current_target,scores={t_1=4,t_2=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:water replace minecraft:air

#Large w WWWW
execute at @s[tag=current_target,scores={t_1=4,t_2=4,t_3=4,t_4=4,t_5=0}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 minecraft:water replace minecraft:air

#Clear w small
execute at @s[tag=current_target,scores={t_1=3,t_2=4,t_3=1,t_4=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:air replace minecraft:water

#Clear w large FFFFWA
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=4,t_6=1,t_7=0}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 minecraft:air replace minecraft:water

#Ice WFWF
execute at @s[tag=current_target,scores={t_1=4,t_2=3,t_3=4,t_4=3,t_5=0}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 minecraft:ice replace minecraft:water

#Ice WF
execute at @s[tag=current_target,scores={t_1=4,t_2=3,t_3=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:ice replace minecraft:water

#Cutting SFE
execute at @s[tag=current_target,scores={t_1=5,t_2=3,t_3=2,t_4=0}] run function magic:weave_cut_hard
execute at @s[tag=current_target,scores={t_1=5,t_2=3,t_3=2,t_4=0}] run tag @s add weave_damaged


#Light AFA
execute at @s[tag=current_target,scores={t_1=1,t_2=3,t_3=1,t_4=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:light replace minecraft:air

#Blindness AFAAAFA
execute at @s[tag=current_target,scores={t_1=1,t_2=3,t_3=1,t_4=1,t_5=1,t_6=3,t_7=1,t_8=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s blindness 10 255 true

#Pain FFSFFS
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=5,t_4=3,t_5=3,t_6=5,t_7=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s nausea 10 255 true
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=5,t_4=3,t_5=3,t_6=5,t_7=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s darkness 10 255 true
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=5,t_4=3,t_5=3,t_6=5,t_7=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s poison 10 255 true

#Stun ASW
execute at @s[tag=current_target,scores={t_1=1,t_2=5,t_3=4,t_4=0}] run function magic:weave_stun

#Shield SSSS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] run function magic:weave_shield

#Progressive SSS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=0}] run function magic:weave_progressive_shield

#Shield active S*14
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=5,t_9=5,t_10=5,t_11=5,t_12=5,t_13=5,t_14=5,t_15=0}] run function magic:weave_shield_active

#Shield destroy/strike back S*18
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=5,t_9=5,t_10=5,t_11=5,t_12=5,t_13=5,t_14=5,t_15=5,t_16=5,t_17=5,t_18=5,t_19=0}] run function magic:weave_destroy_shield

#Sever active S*17
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=5,t_9=5,t_10=5,t_11=5,t_12=5,t_13=5,t_14=5,t_15=5,t_16=5,t_17=5,t_18=0}] run function magic:weave_sever_active

#Finder SSSSS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=0}] run function magic:weave_finder

#Sever SSSSSSS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=0}] run function magic:weave_still

#Invert SS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] player_id run scoreboard players set @s invert 20

#Disguise SSSSSSSS
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5, t_5=5,t_6=5,t_7=5,t_8=5, t_9=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] player_id run scoreboard players set @s disguise 10

#Small level W
execute at @s[tag=current_target,scores={t_1=2,t_2=0}] run fill ~ ~-1 ~ ~ ~1 ~ minecraft:air replace #magic:balefire_destroyable
execute at @s[tag=current_target,scores={t_1=2,t_2=0}] run tag @s add weave_damaged

#Level ground EEEEEE
execute at @s[tag=current_target,scores={t_1=2,t_2=2,t_3=2,t_4=2, t_5=2,t_6=2,t_7=0}] run fill ~-5 ~1 ~-5 ~5 ~4 ~5 minecraft:air replace #magic:balefire_destroyable
execute at @s[tag=current_target,scores={t_1=2,t_2=2,t_3=2,t_4=2, t_5=2,t_6=2,t_7=0}] run tag @s add weave_damaged

#Bridge (renew mainly)
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=3,t_5=1,t_6=0}] run function magic:bridge

#Air shield AAFF small around player
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=3,t_4=3,t_5=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] player_id at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:glass replace minecraft:air

#Air shield AAAAFFFF
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=3,t_6=3,t_7=3,t_8=3,t_9=0}] run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:glass replace minecraft:air
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=3,t_6=3,t_7=3,t_8=3,t_9=0}] run fill ~4 ~4 ~4 ~-4 ~-4 ~-4 minecraft:air replace minecraft:glass

#Levitate AA
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=0}] run function magic:weave_levitate

#Kill EFFWFFE
execute at @s[tag=current_target,scores={t_1=2,t_2=3,t_3=3,t_4=4,t_5=3,t_6=3,t_7=2,t_8=0}] run function magic:weave_kill

#Bind AAAA
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=0}] run function magic:weave_bind

#Throw AAAAA, in along_execute

#Slow AAA
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=0}] run function magic:weave_slow

#Basic travel EEEEFWFASSSAFWFEEEE
execute at @s[tag=current_target,scores={t_1=2, t_2=2, t_3=2, t_4=2, t_5=3, t_6=4, t_7=3, t_8=1, t_9=5,t_10=5, t_11=5, t_12=1, t_13=3, t_14=4, t_15=3, t_16=2, t_17=2,t_18=2,t_19=2,t_20=0}, tag=!holds_travel,tag=!gateway_end] run function magic:weave_travel

#Tar travel EEEFWASSAWFEEE
execute at @s[tag=current_target,scores={t_1=2,t_2=2,t_3=2,t_4=3,t_5=4,t_6=1,t_7=5,t_8=5,t_9=1,t_10=4,t_11=3,t_12=2,t_13=2,t_14=2,t_15=0}, tag=!holds_travel,tag=!gateway_end] run function magic:weave_travel_tar

#Heal AASW
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=5,t_4=4,t_5=0}] run function magic:weave_heal

#Sword AFAFFF
execute at @s[tag=current_target,scores={t_1=1,t_2=3,t_3=1,t_4=3,t_5=3,t_6=3,t_7=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] player_id unless entity @s[nbt={Inventory:[{id:"minecraft:golden_sword",tag:{Force:20}}]}] run give @s golden_sword[unbreakable={show_in_tooltip:0b},enchantments={levels:{fire_aspect:20,sharpness:20},show_in_tooltip:0b},custom_name='[{"text":"Fire sword","italic":false}]',lore=['[{"text":"Force","italic":false}]'],custom_data={Force:20}] 1

#Sense weaves SSWWFFEEAA
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=4,t_4=4,t_5=3,t_6=3,t_7=2,t_8=2,t_9=1,t_10=1,t_11=0}] run function magic:weave_sense

#Balefire SSFSSFSS, in along_execute
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] run tag @s add weave_damaged

#Fire filament ray, in along_execute FFAFFAFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] run tag @s add weave_damaged

#Invisibility
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=3,t_4=3,t_5=1,t_6=1,t_7=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s invisibility 20 255 true

#Invurnability AAAFFFAAA
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=1,t_4=3,t_5=3,t_6=3,t_7=1,t_8=1,t_9=1,t_10=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run effect give @s resistance 20 255 true

#Air shield, walkable AAFAA
execute at @s[tag=current_target,scores={t_1=1,t_2=1,t_3=3,t_4=1,t_5=1,t_6=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run scoreboard players set @s projectile_shielded 10

#Cut items FA
execute at @s[tag=current_target,scores={t_1=3,t_2=1,t_3=0}] run function magic:weave_cut_items

#Cutting AF
execute at @s[tag=current_target,scores={t_1=1,t_2=3,t_3=0}] run function magic:weave_cut_soft
execute at @s[tag=current_target,scores={t_1=1,t_2=3,t_3=0}] run tag @s add weave_damaged

#Block shield SSSSSAAAAA
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=1,t_7=1,t_8=1,t_9=1,t_10=1,t_11=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run scoreboard players set @s shields_blocked 2
execute at @s[tag=current_target,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=1,t_7=1,t_8=1,t_9=1,t_10=1,t_11=0}] run tag @s add weave_damaged

#Block all shields
execute at @s[tag=current_target,scores={t_1=5,t_2=1,t_3=0}] as @a[tag=can_use] if score @s player_id = @e[limit=1, tag=current_target] weave_execute_id run scoreboard players set @s shields_blocked 5

#Player trigger ward SASAS
execute at @s[tag=current_target,scores={t_1=5,t_2=1,t_3=5,t_4=1,t_5=5,t_6=0}] run tag @s add ward_trigger
execute at @s[tag=current_target,scores={t_1=5,t_2=1,t_3=5,t_4=1,t_5=5,t_6=0}] run tag @s remove ward_connected

#Entity trigger ward SAEAS
execute at @s[tag=current_target,scores={t_1=5,t_2=1,t_3=2,t_4=1,t_5=5,t_6=0}] run tag @s add ward_trigger
execute at @s[tag=current_target,scores={t_1=5,t_2=1,t_3=2,t_4=1,t_5=5,t_6=0}] run tag @s remove ward_connected

#Charger EEAASSSSAAEE
execute at @s[tag=current_target,scores={t_1=2,t_2=2,t_3=1,t_4=1,t_5=5,t_6=5,t_7=5,t_8=5,t_9=1,t_10=1,t_11=2,t_12=2,t_13=0}] run function magic:weave_own_charger

#Anreal start+end EASAEEASAEEASAE
execute at @s[tag=current_target,scores={t_1=2,t_2=1,t_3=5,t_4=1,t_5=2,t_6=2,t_7=1,t_8=5,t_9=1,t_10=2,t_11=2,t_12=1,t_13=5,t_14=1,t_15=2,t_16=0}] run function magic:create_angreal

#Sink power S
execute at @s[tag=current_target,scores={t_1=5,t_2=0}] run function magic:weave_sink_power

#Small lava FEF
execute at @s[tag=current_target,scores={t_1=3,t_2=2,t_3=3,t_4=0}] run fill ~ ~-1 ~ ~ ~1 ~ lava replace stone
execute at @s[tag=current_target,scores={t_1=3,t_2=2,t_3=3,t_4=0}] run fill ~ ~-1 ~ ~ ~1 ~ lava replace deepslate
execute at @s[tag=current_target,scores={t_1=3,t_2=2,t_3=3,t_4=0}] run tag @s add weave_damaged

#Large lava FFFFEFFFF
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=2,t_6=3,t_7=3,t_8=3,t_9=3,t_10=0}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 lava replace stone
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=2,t_6=3,t_7=3,t_8=3,t_9=3,t_10=0}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 lava replace deepslate
execute at @s[tag=current_target,scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=2,t_6=3,t_7=3,t_8=3,t_9=3,t_10=0}] run tag @s add weave_damaged

tag @s remove current_target