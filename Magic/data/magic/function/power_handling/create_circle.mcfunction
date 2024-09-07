execute at @s if entity @a[distance=1..10,scores={sneak_time=100..},sort=nearest] run tag @s add circle_owner

#Needed it owner uses /function/power_handling/tap_power_circle_member.mcfunction
scoreboard players operation @s[tag=circle_owner] circled_owner_id = @s player_id

execute at @s run playsound minecraft:block.anvil.place ambient @s

give @s[tag=circle_owner] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Circle","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power from circle","italic":false}]'],custom_model_data=1,custom_data={Magic:9}] 32

execute as @s[tag=!circle_owner] run function magic:power_handling/exit

execute at @s as @a[distance=1..10,scores={sneak_time=100..},limit=1,sort=nearest] run function magic:power_handling/enter_circle
