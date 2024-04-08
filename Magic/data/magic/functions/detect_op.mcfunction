tag @s add test_op
#Basically can't use @s in op/deop due to uncertainty whether or not @s is a player
execute store success score Temp reg_1 run deop @a[tag=test_op]
execute if score Temp reg_1 matches 1 run tag @s add op_detected
op @a[tag=test_op,tag=op_detected]
tag @a remove test_op