#TODO if we change circle to depend more on the owner's strength this would have to be changed

#Should also be no need here to move item back from offhand

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_2 0

#Start furthest as the last will be used
execute at @s as @a[tag=can_use,tag=circled,sort=furthest,distance=..10] unless score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s player_id

execute as @a[tag=can_use] if score @s player_id = Temp reg_2 run tag @s add to_be_circle_owner

#Drop anything collected during cirlcle, else it would disappear
execute as @a[tag=to_be_circle_owner] run function magic:drop_current_hotbar
#Might actually just good that the player won't be able to collect these items in time else they too would get showed in the storage

#We want to load it, so that we can store it again
execute as @a[tag=to_be_circle_owner] run function magic:load_hotbar

execute as @a[tag=to_be_circle_owner] run function magic:open
give @a[tag=to_be_circle_owner] minecraft:ender_eye[enchantment_glint_override=1b,custom_name='[{"text":"Circle","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Controls your power from circle","italic":false}]'],custom_model_data=1,custom_data={Magic:9}] 32

scoreboard players operation @a[tag=to_be_circle_owner] cumulative_halve_amount_hold = @s cumulative_halve_amount_hold
scoreboard players operation @a[tag=to_be_circle_owner] current_held = @s current_held

tag @a[tag=to_be_circle_owner] remove circled
tag @a[tag=to_be_circle_owner] add circle_owner

#And we do not call exit, as that will give back any item that might currently be preserved. Instead we just clear every magic item
#execute if entity @a[tag=to_be_circle_owner] run function magic:exit

execute if entity @a[tag=to_be_circle_owner] run function magic:clear_magic_items

execute if entity @a[tag=to_be_circle_owner] run tag @s remove circle_owner
execute if entity @a[tag=to_be_circle_owner] run tag @s add circled
execute if entity @a[tag=to_be_circle_owner] run tag @s remove using
execute if entity @a[tag=to_be_circle_owner] run scoreboard players operation @s circled_owner_id = @a[tag=to_be_circle_owner] player_id

#Need to be last
tag @a[tag=to_be_circle_owner] remove to_be_circle_owner