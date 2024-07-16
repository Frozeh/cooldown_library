# Cooldown Library
Library for adding items with Minecraft's built-in item cooldown
## How it works
Goat Horns allow for setting custom use_duration which also happens to set its item cooldown, this allows for them to have custom cooldowns. We can disable the sound by inputting any custom sound and putting its range to something low such as 0.01. 
## Caveats
However, this system is not perfect as it will apply this cooldown to all goat horn items. Goat horns is also an easy right click with `ùsing_item` advancement trigger. Though for some reason you can still use the goat horn despite the cooldown being initiated if you continously hold it after using it. This library cancels the holding of right click by using ID-trickery with /clear. It is not possible to use attributes on a custom item with cooldowns due to this with the holding right-click cancel. Though it is quite easy to fix this for your own purpose. This library in particular only supports 1 count stackable items for now, may change in the future. The loot table below spawns a goat horn with a cooldown of 10 ticks, you may modify this as you wish.
```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:goat_horn",
          "functions": [
            {
              "function": "set_components",
              "components": {
                "custom_data": {
                  "cdlib": 1
                },
                "instrument": {
                  "use_duration": 10,
                  "range": 0.01,
                  "sound_event": "entity.zombie.death"
                }
              }
            }
          ]
        }
      ]
    }
  ]
}

```
## Goat Horn mechanics
Modifying the goat horn in the same tick using an item modifier causes any attempt of cancelling the item to fail in the same tick, except for the use of /clear as far as I know, hence the limitations.

## How to use
Simply install the datapack and add an item to the loot table with the following data:
```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:goat_horn",
          "functions": [
            {
              "function": "minecraft:set_name",
              "entity": "this",
              "name": "test"
            },
            {
              "function": "minecraft:set_attributes",
              "modifiers": [
                {
                  "id": "cdlib.id",
                  "attribute": "minecraft:generic.luck",
                  "amount": {
                    "min": -100000,
                    "max": 100000
                  },
                  "operation": "add_value",
                  "slot": "body"
                }
              ]
            },
            {
              "function": "minecraft:toggle_tooltips",
              "toggles": {
                "attribute_modifiers": false
              }
            },
            {
              "function": "set_components",
              "components": {
                "custom_data": {
                  "cdlib": 1
                },
                "instrument": {
                  "use_duration": 10,
                  "range": 0.01,
                  "sound_event": "entity.zombie.death"
                }
              }
            }
          ]
        }
      ]
    }
  ]
}

```
Just add these functions to your item and make sure it is a goat horn and it will now have the built-in Minecraft cooldown
