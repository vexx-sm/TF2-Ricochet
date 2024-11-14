
<h1 align="center">Ricochet - Bouncy / Floating projectiles in TF2</h1>

This plugin adds a guidance system that enables projectiles to bounce/ricochet/hover on surfaces.

The plugin essentialy draws 4 beams or [whiskers](https://i.imgur.com/Crf7ZU2.mp4) at a certain angle around any projectile to form a cone, when the cone is triggered the projectile's direction will be corrected to avoid said trigger.

> [!NOTE]
> The plugin is in an early stage and currently doesn't cover ALL projectiles.

[!!preview](https://github.com/user-attachments/assets/59efcbd3-4602-4488-a5d7-bdfb8aee361e)

## Features

1. **Projectile System**:
   - Supports rockets, arrows, flares, and other projectiles.
   - Tracks each projectile's velocity for a more natural surface flow.
   - Calculates surface normals for smooth transitions.

2. **Visual Feedback System**:
   - Golden energy rings appear at surface interaction points.
   - Visual indicators scale with projectile velocity for a clear representation of behavior.

3. **Configuration System**:
   - Customizable through `ricochet.cfg` and can be updated without restarting:
   
     - `whisker_length` - Controls surface detection range.
     - `whisker_angle` - Determines detection cone width.
     - `max_bounces` - Sets redirection limits per projectile.
     - `show_whiskers` - A toggle that shows the cone in game for an easier time adjusting it.


## Commands

- `sm_rico` - Opens admin controls to toggle plugin state, reload configuration, and adjust settings.


## Installation

1. Download the latest `Ricochet.smx` and `Ricochet.cfg` from the [Releases](https://github.com/vexx-sm/tf2-ricochet/releases) page and place them in your `sourcemod\plugins` and `sourcemod\configs` folder.

2. Reload the plugin or restart your server.

## Requirements

- The latest [SourceMod](https://www.sourcemod.net/downloads.php) release.

- If you plan to compile the plugin on your own make sure to have [math.inc](https://github.com/vexx-sm/TF2-Ricochet/blob/main/scripting/include/math.inc) in your include folder.

## License & Contributing

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Requests** & Contributions are welcome! Feel free to submit a Pull Request.
