#TODO if we change circle to depend more on the owner's strength this would have to be changed

#Entity with tag to_be_circle_owner_temp becomes owner, @s loses controll

#Should also be no need here to move item back from offhand

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_2 0

#Drop anything collected during cirlcle, else it would disappear
execute as @a[tag=to_be_circle_owner_temp] run function magic:drop_current_hotbar
#Might actually just good that the player won't be able to collect these items in time else they too would get showed in the storage

#We want to load it, so that we can store it again
execute as @a[tag=to_be_circle_owner_temp] run function magic:load_hotbar

execute as @a[tag=to_be_circle_owner_temp] run function magic:power_handling/open
give @a[tag=to_be_circle_owner_temp] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Circle","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power from circle","italic":false}]'],custom_model_data=1,custom_data={Magic:9}] 32

scoreboard players operation @a[tag=to_be_circle_owner_temp] cumulative_halve_amount_hold = @s cumulative_halve_amount_hold
scoreboard players operation @a[tag=to_be_circle_owner_temp] current_held = @s current_held

tag @a[tag=to_be_circle_owner_temp] remove circled
tag @a[tag=to_be_circle_owner_temp] add circle_owner

#And we do not call exit, as that will give back any item that might currently be preserved. Instead we just clear every magic item
#execute if entity @a[tag=to_be_circle_owner_temp] run function magic:power_handling/exit

execute if entity @a[tag=to_be_circle_owner_temp] run function magic:clear_magic_items

execute if entity @a[tag=to_be_circle_owner_temp] run tag @s remove circle_owner
execute if entity @a[tag=to_be_circle_owner_temp] run tag @s add circled
execute if entity @a[tag=to_be_circle_owner_temp] run tag @s remove using
execute if entity @a[tag=to_be_circle_owner_temp] run scoreboard players operation @s circled_owner_id = @a[tag=to_be_circle_owner_temp] player_id

#Need to be last
tag @a remove to_be_circle_owner_temp