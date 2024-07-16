# Clears goat horn that was used cancelling holding right click
$clear @s goat_horn[attribute_modifiers={modifiers:[{id:"cdlib.id",type:"generic.luck",amount:$(id),operation:"add_value",slot:"body"}],show_in_tooltip:false}]

# Applies original data
item replace entity @s weapon.mainhand with goat_horn
$item modify entity @s weapon.mainhand [{"function":"minecraft:set_components","components":$(components)}]