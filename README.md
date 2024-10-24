# Godot Top-Down Example
 
## Features

- Global (autoload) SceneLoader node
- Splash screen template
- Title screen template
- Top-down tile-based world example
- Top-down player movement and collisions
- Item resource
    - pickup representation
    - inventory representation
    - item stack maximum
- Items
    - Coin
    - Key
- Item_Stacks
    - Parent of items to keep track of quantity
    - Optional .tscn version for filling ItemContainers
- Basic inventory system
    - Item stack count
- Item pickup scene
- Proximity System
  - Nearest proximity area will highlight and interact with player

## Future Additions

- Items
    - Equipped representation
- Inventory improvement
    - click and drag reorganization
    - move items between player and container inventories
    - drop items on ground
- Enemies
- Health node
- Building interiors
- Functional doors
- Proximity interaction system
    - display input for interacting with proximity areas
- Purchasing from NPCs
- Controller support
- Saving/loading inventory
- Chest - Open Animation

## Known Issues

- Player movement should be refactored into a specific node
- Player item area 2d logic should be refactored to be on player

## Assets from Kenney's Assets

https://kenney.nl/assets/tiny-town

https://kenney.nl/assets/1-bit-pack

https://kenney.nl/assets/tiny-dungeon