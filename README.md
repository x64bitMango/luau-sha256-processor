# sha256 Decryption Processing Tool
![Lua](https://img.shields.io/badge/luau-%232C2D72.svg?style=for-the-badge&logo=luau&logoColor=white)
![Roblox](https://img.shields.io/badge/Roblox-%230a0b0b.svg?style=for-the-badge&logo=Roblox&logoColor=white)
![Discord](https://img.shields.io/badge/Webhook_Integration-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)

Built ages ago as a proof-of-concept to see how well I could optimize a bruteforcing tool to decrypt sha256 hashes. I decided to place it in a repo so others can build upon it.

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

## Benchmark Table

The phrase 'fart' was used for the standard for the hash cracking benchmark table. At 233911 hashing iterations (233911000 hashes) ran at 1000 hashes per iteration, the following results were charted:

`I/s -> ⌊Iterations per second⌋`
`H/s -> ⌊Hashes per second⌋`

|  | Test 1 | Test 2 | Test 3 | Test 4 | Test 5 | Avg. |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| **I/s**  | 40801  | 48090  | 29680  | 19013 | 20713 | 31659 |
| **H/s**  | 40801514  | 48090254  | 29680370  | 19013908 | 20713286 | 31659866 |
| **Time (sec)**  | 5.7329  | 4.8640  | 7.8810  | 12.3021  | 11.2928  | 8.41456 |

These results round about to just under 8.5 seconds for 233911000 hashes, or about 31659866 hashes/s while iterating through 1000 hashes per iteration.

## Usage
At its default (current) state, the hash decryption tool does 1,000 hashes per hash iteration, and attempts to bruteforce the hash with every possible iteration, and will not stop until it has found the correct string which matches the correct hashed string. 

This is a bruteforced tool, so naturally it consumes many resources to run. A compressed `.rbxm` model will soon be released for ease of importability.


## Discord webhook integration
`DiscordWH.lua` is an optional webhook integration module, used for sending webhook updates in Discord servers. Webhook integration is placed right on top of output benchmarks. 

Discord WebHook integration is not hardcoded into the hasher, so if you don't want the webhook, you can delete the `DiscordWH` module script, and then 

<img width="580" height="95" alt="image" src="https://github.com/user-attachments/assets/829860f5-4060-4e13-9a8b-7f33e8dc53af" />


<img width="435" height="111" alt="image" src="https://github.com/user-attachments/assets/2a3f0c23-b901-4200-afd0-4742056c03e2" />

## Future plans
I will definitely keep working on sprucing up the code in this repository, as when I initially designed it, it was for my eyes only. I hacked together a parent-child hierarchy independant version of the scripts for this repository, too. There will definitely be more cleaning to come.

Initially, I thought "hey, what if I could make a bitcoin miner in Roblox? Wouldn't I just be able to mine bitcoin in the background of games while other people play them?" and yeah, that's a pretty fricking goofy idea. Bitcoin hashers/miners use double SHA256, meaning that they're encrypted with two layers of hashes. This is subsequently why I included the "single layer processor" comment in the `main.lua` script. While this is definitely anything but a bitcoin miner, it carries through if not the largest hurdle: an actual hashing tool, and I'm okay to leave it at that.



## License
© Mozilla Public License Version 2.0 2026
