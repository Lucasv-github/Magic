scoreboard players operation Temp reg_1 = @s weave_locked_player_id
execute as @a if score @s player_id = Temp reg_1 unless entity @s[nbt={Inventory:[{id:"minecraft:golden_pickaxe",components:{"minecraft:custom_data":{Magic:32}}}]}] run give @s golden_pickaxe[custom_name='["",{"text":"Fire pickaxe","italic":false,"color":"dark_red"}]',enchantment_glint_override=true,unbreakable={show_in_tooltip:false},enchantments={levels:{"magic:fire_aspect_no_xp":50,"magic:sharpness_no_xp":10,"magic:efficency_no_xp":20},show_in_tooltip:false},custom_data={Magic:32}]
tag @s add weave_fire_pickaxe
