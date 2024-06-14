#tellraw @a {"score":{"name":"@s","objective":"reg_1"}}
scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
scoreboard players operation @s cumulative_halve_amount_hold *= @s reg_1
scoreboard players operation @s regenerated_strength *= @s reg_1
scoreboard players operation @s angreal_level = @s reg_1

tag @s add angrealed

execute at @s run playsound minecraft:block.anvil.place ambient @s

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"swap_held"}', Invulnerable:1b, Tags:["swap_held"], NoGravity:1}
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.0 from entity @s weapon.mainhand
item replace entity @e[tag=swap_held,sort=nearest,limit=1] container.1 from entity @s weapon.offhand

item replace entity @s weapon.mainhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.1
item replace entity @s weapon.offhand from entity @e[tag=swap_held,sort=nearest,limit=1] container.0

tp @e[tag=swap_held] ~ ~-1000 ~