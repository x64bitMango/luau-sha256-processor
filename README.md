# sha256 Decryption Processor Benchmark Tool
![Lua](https://img.shields.io/badge/luau-%232C2D72.svg?style=for-the-badge&logo=luau&logoColor=white)
![Discord](https://img.shields.io/badge/Webhook_Integration-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)

Built ages ago as a proof-of-concept, and I decided to place it in a repo for others to build upon.

>[!IMPORTANT]
> Server-side CPU usage goes through the roof with constant/heavy load hash amounts. If you want to keep playability alongside having background hashes, change the hashes per iteration value in `main.lua`. It has the variable name `TestAmount`.

## Requirements:

For the decryption processor to run properly, the following must occur:
- The following security settings need to be enabled in Game Settings:
  - 'Allow HTTP Requests'
  - 'Allow Loading Third Party Assets'
- The following script types must be correctly defined:
  - `main` must be a script.
  - `DiscordWH` must be a module script.
- Both `main` and `DiscordWH` should be a child of the same parent, and subsequently should be in the same directory (unless independetly changed)

> [!NOTE]
> Optionally, you can include the [HashLib library](https://create.roblox.com/store/asset/4544052033/HashLib?keyword=hashlib&pageNumber=1&pagePosition=0) dependency directly as a child of the `main` script, and possibly increase initial loading speeds, as a direct install would remove the information retrieving layer of module importing. To do so, import the HashLib directly, add it as a child of the `main` script, and replace `local HashLib = require(5167746890)` with `local HashLib = require(script.HashLib)`.


## Discord webhook integration
`DiscordWH.lua` is an optional webhook integration module, used for sending webhook updates in Discord servers. Webhook integration is placed right on top of output benchmarks. 

Discord WebHook integration is not hardcoded into the hasher, so if you don't want the webhook, you can delete the `DiscordWH` module script, and then 

<img width="580" height="95" alt="image" src="https://github.com/user-attachments/assets/829860f5-4060-4e13-9a8b-7f33e8dc53af" />


<img width="435" height="111" alt="image" src="https://github.com/user-attachments/assets/2a3f0c23-b901-4200-afd0-4742056c03e2" />
