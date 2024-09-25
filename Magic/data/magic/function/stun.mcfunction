$damage @s $(stun_amount) minecraft:magic
effect give @s nausea 5
$clear @s[nbt=!{SelectedItem:{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Magic:6}}}}] ender_eye $(stun_amount)