advancement revoke @s only cdlib:offhand

# gets data from goat horn
data modify storage cdlib:data item.components set from entity @s Inventory[{Slot:-106b}].components

# needs ID to know where it was used in hotbar (we have to use clear in order to cancel holding right click) 
data modify storage cdlib:data item.id set from storage cdlib:data item.components."minecraft:attribute_modifiers".modifiers[{id:"minecraft:cdlib.id"}].amount

function cdlib:offhand/cancel_rc with storage cdlib:data item