scoreboard players operation Temp reg_1 = @s weave_locked_player_id
execute as @a if score @s player_id = Temp reg_1 unless entity @s[nbt={Inventory:[{id:"minecraft:golden_sword",components:{"minecraft:custom_data":{Magic:30}}}]}] run give @s golden_sword[custom_name=["",{"text":"Fire sword","italic":false,"color":"dark_red"}],minecraft:item_model="magic_resourcepack:fire_sword",enchantment_glint_override=true,unbreakable={},enchantments={"magic:fire_aspect_no_xp":50,"magic:sharpness_no_xp":10,"magic:looting_no_xp":5},tooltip_display={hidden_components:[enchantments,unbreakable]},custom_data={Magic:30}]

tag @s add weave_fire_sword
