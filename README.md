# Star Wars: Galaxy of Heroes - Daily Farmbot

The main porpuse is to automate doing the daily activities and collecting the basic tokens you get from doing these activities. This is a very early version and more a proof of concept as most things are just hardcoded for my needs.

The farmbot will never be 100% failsafe because my priority is to have it 100% able to run in the background without annoying me. But as I haven't figured out pixelreading on background windows this will always be a rather fragile script. Also, another big problem right now is that we can't do mousedrags in a window that is in the background, if someone finds out how to do this it'll make things way easier.

**Known errors:**
- Can't do the *buy 3 shipments* daily activity (bcz no mousedrag doable)
- Can't do the *equip 1 equipment* daily activity (bcz no background pixel reading)
- *do 1 mod upgrade* is hardcoded to strongest character, mod position 4

## Warning: It's not adviced to run the script on your own right now WITHOUT MAKING ADJUSTMENTS TO THE SCRIPT. It will 100% fail at some point in the script. At the moment see it more as A HEADSTART TO CREATE YOUR OWN SCRIPT.

**Requirements:**
- 1920x1080 Monitor (all click coordinates are hardcoded atm)
- Andyroid 46.16.819
- Star Wars: Galaxy of Heroes installed on Andyroid (AND NOTHING ELSE)

**Preparations:**
- Prepare your default teams for 
    - Squad Arena
    - Fleet Arena
    - Galactic Conflict (Has to be able to reliably auto battle the first 6 fights)
- Have Ship-Cantina unlocked
- All Hero Challenges 3\*
- All Ship Challenges 3\*
- 4C Hard Dark Side 3\* completed
- 4D Hard Dark Side not completed
- 5D Hard Light Side 3\* completed
- 5E Hard Light Side not completed
- Have enough Sim Tickets (50 should be more than enough)
- Atleast 108 Normal Energy (**important** otherwise it will buy energy with crystals by accident)
- Atleast 12 Cantina Energy (**important** otherwise it will buy energy with crystals by accident)
    
**How to start:**
1. Compile the script or download  *swhog-daily-farmbot.exe*
2. Adjust the path in the GUI so it points to the Andy.exe
3. Adjust the waiting time for Andyroid and SW:GOH to start.
5. Press *Start* and let the magic happen

**Can I run it in the background?**
Completly background automated, start it, do something else.

**What resources do I get?**
Basicall all daily activities and some extra shards.
- Ashoka Shards
- Old Ben Shards
- 200 Squad Arena Tokens
- 400 Galactic War Tokens
- XXX Fleet Arena Tokens
- 62 Crystals from Daily Activities
- XXX Sim-Tickets
- XXX Credits

**What is it doing?**
- Available daily (hero and ship) challenges 
- Auto battles the first 6 fights of Galactic War
- Auto battles 5 squad arena fights
- Auto battles 5 fleet arena fights
- Trains the lowest character with 1 of your lowest training droids
- Enhances the lowest ship with 1 of your lowest training droids
