execute at @s run tellraw @a[tag=using, tag=can_use, distance=..10] ["",{"selector":"@s","color":"gold"},{"text":" Circle ","color":"gold"},{"text":"~~~~","color":"gold","clickEvent":{"action":"run_command","value":"/trigger state set 10"}}]
tag @s add circle_owner
#Needed it owner uses /function/tap_power_circle_member.mcfunction
scoreboard players operation @s circled_owner_id = @s player_id

#Base hold from owner (will work with angreal)

execute at @s run playsound minecraft:block.anvil.place ambient @s

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"swap_held"}', Invulnerable:1b, Tags:["swap_held"], NoGravity:1}
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.0 from entity @s weapon.mainhand
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.1 from entity @s weapon.offhand

item replace entity @s weapon.mainhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.1
item replace entity @s weapon.offhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.0

tp @e[tag=swap_held] ~ ~-1000 ~

give @s minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Circle","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Circle","italic":false}]'],custom_model_data=0,custom_data={Force:9}] 32

scoreboard players set @s circle_timer 41