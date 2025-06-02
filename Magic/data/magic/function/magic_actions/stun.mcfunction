damage @s 1 minecraft:magic
effect give @s nausea 5
$execute unless items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] $(stun_amount)