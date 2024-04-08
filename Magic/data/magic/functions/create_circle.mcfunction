execute at @s run tellraw @a[tag=using, tag=can_use, distance=..10] ["",{"selector":"@s","color":"gold"},{"text":" Circle ","color":"gold"},{"text":"~~~~","color":"gold","clickEvent":{"action":"run_command","value":"/trigger state set 10"}}]
tag @s add circle_owner

give @s minecraft:lead{CustomModelData:0,display:{Name:'[{"text":"Circle","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:10} 1

#Base hold from owner (will work with angreal)

execute at @s run playsound minecraft:block.anvil.place ambient @s

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"swap_held"}', Invulnerable:1b, Tags:["swap_held"], NoGravity:1}
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.0 from entity @s weapon.mainhand
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.1 from entity @s weapon.offhand

item replace entity @s weapon.mainhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.1
item replace entity @s weapon.offhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.0

tp @e[tag=swap_held] ~ ~-1000 ~

scoreboard players set @s circle_timer 41