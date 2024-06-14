function magic:calculate_distance
#Distance 0.1.. is to prevent self
execute at @s[tag=using,scores={disguise=0}] run tellraw @a[tag=can_see,tag=truly_see,distance=0.1..] ["",{"selector":"@s","color":"gold"},{"text":" Holding: ","color":"gold"},{"score":{"name":"@s","objective":"current_held"},"color":"gold"}]
