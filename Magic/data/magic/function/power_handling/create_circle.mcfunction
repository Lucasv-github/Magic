#@s becomes owner and person with the tag create_circle_member_temp will become the member

execute if entity @a[tag=create_circle_member_temp] run tag @s add circle_owner

#Needed it owner uses /function/power_handling/tap_power_circle_member.mcfunction
scoreboard players operation @s[tag=circle_owner] circled_owner_id = @s player_id

execute at @s[tag=circle_owner] run playsound minecraft:block.anvil.place ambient @s

give @s[tag=circle_owner] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Circle","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power from circle","italic":false}]'],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:9,Magic_preserve:1}] 32

execute as @s[tag=!circle_owner] run function magic:power_handling/exit

#Needed when using magic:power_handling/enter_circle
tag @s add circle_owner_temp

execute at @s as @a[tag=create_circle_member_temp] run function magic:power_handling/enter_circle

#Fallback if magic:power_handling/enter_circle does not run
tag @a remove circle_owner_temp

tag @a remove create_circle_member_temp
