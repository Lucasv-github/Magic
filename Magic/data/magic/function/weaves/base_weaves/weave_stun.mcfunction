scoreboard players operation Temp reg_1 = @s weave_locked_player_id

$execute at @s as @a[tag=using] if score @s player_id = Temp reg_1 run damage @s $(size) minecraft:magic
$execute at @s as @a[tag=using] if score @s player_id = Temp reg_1 run effect give @s nausea $(size)
$execute at @s as @a[tag=using] if score @s player_id = Temp reg_1 run clear @s[nbt=!{SelectedItem:{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}}] ender_eye $(size)