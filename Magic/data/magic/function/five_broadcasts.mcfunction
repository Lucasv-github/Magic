function magic:calculate_distance
execute at @s[tag=using,scores={disguise=0}] run tellraw @a[tag=can_see,tag=truly_see] ["",{"selector":"@s","color":"gold"},{"text":" Holding: ","color":"gold"},{"score":{"name":"@s","objective":"current_held"},"color":"gold"}]
