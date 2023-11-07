BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "agents_role" (
	"a_role"	TEXT NOT NULL,
	"role_details"	TEXT NOT NULL,
	PRIMARY KEY("a_role")
);
CREATE TABLE IF NOT EXISTS "agents_details" (
	"a_num"	INTEGER NOT NULL,
	"a_name"	TEXT NOT NULL,
	"a_role"	TEXT NOT NULL,
	PRIMARY KEY("a_num"),
	FOREIGN KEY("a_role") REFERENCES "agents_role"("a_role")
);
CREATE TABLE IF NOT EXISTS "agents_abilities" (
	"a_num"	INTEGER NOT NULL,
	"ability_name"	TEXT NOT NULL,
	"ability_details"	TEXT NOT NULL,
	FOREIGN KEY("a_num") REFERENCES "agents_details"("a_num")
);
INSERT INTO "agents_role" ("a_role","role_details") VALUES ('Controller','Secondary Entry Fragger and Lurker
Controllers are experts at controlling the battlefield by the use of smoke screens. Their abilities disrupt their opponents’ sightlines whilst providing cover for teammates as they take control of an area.'),
 ('Sentinel','Support and In-Game Leader
Sentinels are defensive experts that have abilities that manipulate the battlefield, lock-down areas of contention and provide utility. They will either move around the map to gather more information or when defending, will be an anchor on a bombsite with the goal of slowing down opponents so that teammates have enough time to provide assistance.'),
 ('Initiator','Recon and Crowd Control
Initiators excel at gathering information and controlling the movements of opponents through the use of their abilities. While Initiators are in a category of their own, they could easily perform the defensive role of a Sentinel or Controller, or take a more proactive role like a Duelist.'),
 ('Duelist','Entry Fragger
Duelists are the offensive experts in VALORANT with abilities that allow them to be aggressive and self-sufficient when creating opportunities to engage with opponents. They are expected to be proactive and are the stars within the team that garner the most amount of kills. They will typically fulfil the role of Entry Fragger, being the first person to enter an area of the map in contention and perform high-risk, high-reward actions to gain an advantage. The Duelist role is particularly volatile and leads to players experiencing a feast-or-famine scenario in performance, thus teams should give these roles to teammates with excellent aim.');
INSERT INTO "agents_details" ("a_num","a_name","a_role") VALUES (1,'Brimstone','Controller'),
 (2,'Viper','Controller'),
 (3,'Omen','Controller'),
 (4,'Killjoy','Sentinel'),
 (5,'Cypher','Sentinel'),
 (6,'Sova','Initiator'),
 (7,'Sage','Sentinel'),
 (9,'Phoenix','Duelist'),
 (10,'Jett','Duelist'),
 (11,'Reyna','Duelist'),
 (12,'Raze','Duelist'),
 (13,'Breach','Initiator'),
 (14,'Skye','Initiator'),
 (15,'Yoru','Duelist'),
 (16,'Astra','Controller'),
 (17,'KAY/O','Initiator'),
 (18,'Chamber','Sentinel'),
 (19,'Neon','Duelist'),
 (20,'Fade','Initiator'),
 (21,'Harbor','Controller'),
 (22,'Gekko','Initiator'),
 (23,'Deadlock','Sentinel'),
 (24,'Iso','Duelist');
INSERT INTO "agents_abilities" ("a_num","ability_name","ability_details") VALUES (1,'Incendiary','EQUIP an incendiary grenade launcher. FIRE to launch a grenade that detonates as it comes to a rest on the floor, creating a lingering fire zone that damages players within the zone.'),
 (1,'Sky Smoke','EQUIP a tactical map. FIRE to set locations where Brimstone''s smoke clouds will land. ALT FIRE to confirm, launching long-lasting smoke clouds that block vision in the selected area.'),
 (1,'Stim Beacon','EQUIP a stim beacon. FIRE to toss the stim beacon in front of Brimstone. Upon landing, the stim beacon will create a field that grants players RapidFire.'),
 (1,'Orbital Strike','EQUIP a tactical map. FIRE to launch a lingering orbital strike laser at the selected location, dealing high damage-over-time to players caught in the selected area.'),
 (2,'Poison Cloud','EQUIP a gas emitter. FIRE to throw the emitter that perpetually remains throughout the round. RE-USE the ability to create a toxic gas cloud at the cost of fuel. This ability can be RE-USED more than once and can be picked up to be REDEPLOYED.'),
 (2,'Toxic Screen','EQUIP a gas emitter launcher. FIRE to deploy a long line of gas emitters. RE-USE the ability to create a tall wall of toxic gas at the cost of fuel. This ability can be RE-USED more than once.'),
 (2,'Snake Bite','EQUIP a chemical launcher. FIRE to launch a canister that shatters upon hitting the floor, creating a lingering chemical zone that damages and slows enemies.'),
 (2,'Viper''s Spit','EQUIP a chemical sprayer. FIRE to spray a chemical cloud in all directions around Viper, creating a large cloud that reduces the vision range and maximum health of players inside of it.'),
 (3,'Paranoia','INSTANTLY fire a shadow projectile forward, briefly reducing the vision range of all players it touches. This projectile can pass straight through walls.'),
 (3,'Dark Cover','EQUIP a shadow orb, entering a phased world to place and target the orbs. PRESS the ability key to throw the shadow orb to the marked location, creating a long-lasting shadow sphere that blocks vision. HOLD FIRE while targeting to move the marker further away. HOLD ALT FIRE while targeting to move the marker closer. PRESS RELOAD to toggle normal targeting view.'),
 (3,'Shrouded Step','EQUIP a shadow walk ability and see its range indicator. FIRE to begin a brief channel, then teleport to the marked location.'),
 (3,'From the Shadows','EQUIP a tactical map. FIRE to begin teleporting to the selected location. While teleporting, Omen will appear as a Shade that can be destroyed by an enemy to cancel his teleport.'),
 (4,'Alarmbot','EQUIP a covert Alarmbot. FIRE to deploy a bot that hunts down enemies that get in range. After reaching its target, the bot explodes, applying Vulernable. HOLD EQUIP to recall a deployed bot.'),
 (4,'Turret','EQUIP a Turret. FIRE to deploy a turret that fires at enemies in a 180 degree cone. HOLD EQUIP to recall the deployed turret.'),
 (4,'Nanoswarm','EQUIP a Nanoswarm grenade. FIRE to throw the grenade. Upon landing, the Nanoswarm goes covert. ACTIVATE the Nanoswarm to deploy a damaging swarm of nanobots.'),
 (4,'Lockdown','EQUIP the Lockdown device. FIRE to deploy the device. After a long windup, the device Detains all enemies caught in the radius. The device can be destroyed by enemies.'),
 (5,'Cyber Cage','INSTANTLY toss the cyber cage in front of Cypher. Activate to create a zone that blocks vision and slows enemies who pass through it.'),
 (5,'Spycam','EQUIP a spycam. FIRE to place the spycam at the targeted location. RE-USE this ability to take control of the camera''s view. While in control of the camera, FIRE to shoot a marking dart. This dart will Reveal the location of any player struck by the dart. This ability can be picked up to be REDEPLOYED.'),
 (5,'Trapwire','EQUIP a trapwire. FIRE to place a destructible and covert tripwire at the targeted location creating a line that spans between the placed location and the wall opposite. Enemy players who cross a tripwire will be tethered, revealed, and dazed after a short period if they do not destroy the device in time. This ability can be picked up to be REDEPLOYED.'),
 (5,'Neural Theft','INSTANTLY use on a dead enemy player in your crosshairs to reveal the location of all living enemy players.'),
 (6,'Shock Bolt','EQUIP a bow with a shock bolt. FIRE to send the explosive bolt forward, detonating upon collision and damaging players nearby. HOLD FIRE to extend the range of the projectile. ALT FIRE to add up to two bounces to this arrow.'),
 (6,'Recon Bolt','EQUIP a bow with recon bolt. FIRE to send the recon bolt forward, activating upon collision and Revealing the location of nearby enemies caught in the line of sight of the bolt. Enemies can destroy this bolt. HOLD FIRE to extend the range of the projectile. ALT FIRE to add up to two bounces to this arrow.'),
 (6,'Owl Drone','EQUIP an owl drone. FIRE to deploy and take control of movement of the drone. While in control of the drone, FIRE to shoot a marking dart. This dart will Reveal the location of any player struck by the dart. Enemies can destroy the Owl Drone.'),
 (6,'Hunter''s Fury','EQUIP a bow with three long-range wall-piercing energy blasts. FIRE to release an energy blast in a line in front of Sova, dealing damage and revealing the location of enemies caught in the line. This ability can be RE-USED up to two more times while the ability timer is active.'),
 (7,'Slow Orb','EQUIP a slowing orb. FIRE to throw a slowing orb forward that detonates upon landing, creating a lingering field that slows players caught inside of it.'),
 (7,'Healing Orb','EQUIP a healing orb. FIRE with your crosshairs over a damaged ally to activate a heal-over-time on them. ALT FIRE while Sage is damaged to activate a self heal-over-time.'),
 (7,'Barrier Orb','EQUIP a barrier orb. FIRE places a solid wall. ALT FIRE rotates the targeter.'),
 (7,'Ressurection','EQUIP a resurrection ability. FIRE with your crosshairs placed over a dead ally to begin resurrecting them. After a brief channel, the ally will be brought back to life with full health.'),
 (9,'Curveball','EQUIP a flare orb that takes a curving path and detonates shortly after throwing. FIRE to curve the flare orb to the left, detonating and blinding any player who sees the orb. ALTERNATE FIRE to curve the flare orb to the right.'),
 (9,'Hot Hands','EQUIP a fireball. FIRE to throw a fireball that explodes after a set amount of time or upon hitting the ground, creating a lingering fire zone that damages enemies.'),
 (9,'Blaze','EQUIP a flame wall. FIRE to create a line of flame that moves forward, creating a wall of fire that blocks vision and damages players passing through it. HOLD FIRE to bend the wall in the direction of your crosshair.'),
 (9,'Run it Back','INSTANTLY place a marker at Phoenix’s location. While this ability is active, dying or allowing the timer to expire will end this ability and bring Phoenix back to this location with full health.'),
 (10,'Updraft','INSTANTLY propel Jett high into the air.'),
 (10,'Tailwind','ACTIVATE to prepare a gust of wind for a limited time. RE-USE the wind to propel Jett in the direction she is moving. If Jett is standing still, she propels forward. Tailwind charge resets every two kills.'),
 (10,'Cloudburst','INSTANTLY throw a projectile that expands into a brief vision-blocking cloud on impact with a surface. HOLD the ability key to curve the smoke in the direction of your crosshair.'),
 (10,'Blade Storm','EQUIP a set of highly accurate throwing knives. FIRE to throw a single knife and recharge knives on a kill. ALT FIRE to throw all remaining daggers but does not recharge on a kill.'),
 (11,'Devour','Enemies killed by Reyna leave behind Soul Orbs that last 3 seconds. INSTANTLY consume a nearby soul orb, rapidly healing for a short duration. Health gained through this skill exceeding 100 will decay over time. If EMPRESS is active, this skill will automatically cast and not consume the orb.'),
 (11,'Dismiss','INSTANTLY consume a nearby soul orb, becoming intangible for a short duration. If EMPRESS is active, also become invisible.'),
 (11,'Leer','EQUIP an ethereal destructible eye. ACTIVATE to cast the eye a short distance forward. The eye will Nearsight all enemies who look at it.'),
 (11,'Empress','INSTANTLY enter a frenzy, increasing firing speed, equip and reload speed dramatically. Scoring a kill renews the duration.'),
 (12,'Blast Pack','INSTANTLY throw a Blast Pack that will stick to surfaces. RE-USE the ability after deployment to detonate, damaging and moving anything hit. Raze isn''t damaged by this ability, but will still take fall damage if launched up far enough.'),
 (12,'Paint Shells','EQUIP a cluster grenade. FIRE to throw the grenade, which does damage and creates sub-munitions, each doing damage to anyone in their range. ALT FIRE to lob. Paint Shells charge resets every two kills.'),
 (12,'Boom bot ','EQUIP a Boom Bot. FIRE will deploy the bot, causing it to travel in a straight line on the ground, bouncing off walls. The Boom Bot will lock on to any enemies in its frontal cone and chase them, exploding for heavy damage if it reaches them.

'),
 (12,'Showstopper','EQUIP a rocket launcher. FIRE to shoot a rocket that does massive area damage on contact with anything.'),
 (13,'Flashpoint','EQUIP a blinding charge. FIRE the charge to set fast-acting burst through the wall. The charge detonates to blind all players looking at it.'),
 (13,'Fault Line','EQUIP a seismic blast. HOLD FIRE to increase the distance. RELEASE to set off the quake, dazing all players in its zone and in a line up to the zone.'),
 (13,'Aftershock','EQUIP a fusion charge. FIRE the charge to set a slow-acting burst through the wall. The burst does heavy damage to anyone caught in its area.'),
 (13,'Rolling Thunder','EQUIP a seismic charge. FIRE to send a cascading quake through all terrain in a large cone. The quake dazes and knocks up anyone caught in it.'),
 (14,'Trailblazer','EQUIP a Tasmanian tiger trinket. FIRE to send out and take control of the predator. While in control, FIRE to leap forward, exploding in a concussive blast and damaging directly hit enemies.'),
 (14,'Guiding Light','EQUIP a hawk trinket. FIRE to send it forward. HOLD FIRE to guide the hawk in the direction of your crosshair. RE-USE while the hawk is in flight to transform it into a flash that plays a hit confirm if an enemy was within range and line of sight.'),
 (14,'Regrowth','EQUIP a healing trinket. HOLD FIRE to channel, healing allies in range and line of sight. Can be reused until her healing pool is depleted. Skye cannot heal herself.'),
 (14,'Seekers','EQUIP a Seeker trinket. FIRE to send out three Seekers to track down the three closest enemies. If a Seeker reaches its target, it nearsights them.'),
 (15,'Blindside','EQUIP to rip an unstable dimensional fragment from reality. FIRE to throw the fragment, activating a flash that winds up once it collides with a hard surface in the world'),
 (15,'Gatecrash','EQUIP a rift tether FIRE to send the tether forward ALT FIRE to place a stationary tether ACTIVATE to teleport to the tether''s location USE to trigger a fake teleport'),
 (15,'Fakeout','EQUIP an echo that transforms into a mirror image of Yoru when activated FIRE to instantly activate the mirror image and send it forward ALT FIRE to place an inactive echo USE to transform an inactive echo into a mirror image and send it forward. Mirror images explode in a blinding flash when destroyed by enemies.'),
 (15,'Dimentional Drift','EQUIP a mask that can see between dimensions. FIRE to drift into Yoru''s dimension, unable to be affected or seen by enemies from the outside'),
 (16,'Nova Pulse','Place Stars in Astral Form (X) ACTIVATE a Star to detonate a Nova Pulse. The Nova Pulse charges briefly then strikes, concussing all players in its area.'),
 (16,'Nebula','Place Stars in Astral Form (Ultimate Key). ACTIVATE a Star to transform it into a Nebula (smoke). USE a Star to Dissipate it, returning the Star to be placed in a new location after a delay. Dissipate briefly forms a fake Nebula at the Star''s location before returning.'),
 (16,'Gravity Well','Place Stars in Astral Form (X) ACTIVATE a Star to form a Gravity Well. Players in the area are pulled toward the center before it explodes, making all players still trapped inside fragile.'),
 (16,'Astral Form/Cosmic Devide','ACTIVATE to enter Astral Form where you can place Stars with FIRE. Stars can be reactivated later, transforming them into a Nova Pulse, Nebula, or Gravity Well. When Cosmic Divide is charged, use ALT FIRE in Astral Form to begin aiming it, then FIRE to select two locations. An infinite Cosmic Divide connects the two points you select. Cosmic Divide blocks bullets and heavily dampens audio.'),
 (17,'FLASH/DRIVE','EQUIP a flash grenade. FIRE to throw. The flash grenade explodes after a short fuse, blinding anyone in line of sight.'),
 (17,'ZERO/POINT','EQUIP a suppression blade. FIRE to throw. The blade sticks to the first surface it hits, winds up, and suppresses anyone in the radius of the explosion.'),
 (17,'FRAG/MENT','EQUIP an explosive fragment. FIRE to throw. The fragment sticks to the floor and explodes multiple times, dealing near lethal damage at the center with each explosion.'),
 (17,'NULL/CMD','INSTANTLY overload with polarized radianite energy that empowers KAY/O and causes large energy pulses to emit from his location. Enemies hit with these pulses are suppressed for a short duration.'),
 (18,'Headhunter','ACTIVATE to equip a heavy pistol. ALT FIRE with the pistol equipped to aim down sights.'),
 (18,'Rendezvous','PLACE a teleport anchor. While on the ground and in range of the anchor, REACTIVATE to quickly teleport to the anchor. The anchor can be picked up to be REDEPLOYED.'),
 (18,'TradeMark','PLACE a trap that scans for enemies. When a visible enemy comes in range, the trap counts down and then destabilizes the terrain around them, creating a lingering field that slows players caught inside of it. The trap can be picked up to be REDEPLOYED.'),
 (18,'Tour de Force','ACTIVATE to summon a powerful, custom sniper rifle that will kill an enemy with any direct hit. Killing an enemy creates a lingering field that slows players caught inside of it.'),
 (19,'Relay Bolt','INSTANTLY throw an energy bolt that bounces once. Upon hitting each surface, the bolt electrifies the ground below with a concussive blast.'),
 (19,'High Gear','INSTANTLY channel Neon’s power for increased speed. When charged, ALT FIRE to trigger an electric slide. Slide charge resets every two kills.'),
 (19,'Fast Lane','FIRE two energy lines forward on the ground that extend a short distance or until they hit a surface. The lines rise into walls of static electricity that block vision and damage enemies passing through them.'),
 (19,'Overdrive','Unleash Neon’s full power and speed for a short duration. FIRE to channel the power into a deadly lightning beam with high movement accuracy. The duration resets on each kill.'),
 (20,'Seize','Equip an orb of nightmare ink. FIRE to throw the orb which will plummet to the ground after a set amount of time. Upon hitting the ground, the ink will explode and create a zone in which enemies who are caught in it cannot escape the zone by normal means. RE-USE the ability to drop the projectile early in-flight'),
 (20,'Haunt','Equip a nightmarish entity. FIRE to throw the orb which will plummet to the ground after a set amount of time. Upon hitting the ground, the orb will turn into a nightmarish entity that will reveal the location of enemies caught in its line of sight. Enemies can destroy this entity. RE-USE the ability to drop the projectile early in-flight.'),
 (20,'Prowler','EQUIP a Prowler. FIRE will send the Prowler out, causing it to travel in a straight line. The Prowler will lock onto any enemies or trails in their frontal vision cone and chase them, nearsighting them if it reaches them. HOLD the FIRE button to steer the Prowler in the direction of your crosshair.'),
 (20,'Nightfall','EQUIP the power of Fear. FIRE to send out a wave of nightmare energy that can traverse through walls. The energy creates a trail to the opponent as well as deafens and decays them.'),
 (21,'Cove','EQUIP a sphere of shielding water. FIRE to throw. ALT FIRE to underhand throw. Upon impacting the ground, spawn a destructible water shield that blocks bullets.'),
 (21,'High Tide','EQUIP a wall of water. FIRE to send the water forward along the ground. HOLD FIRE to guide the water in the direction of your crosshair, passing through the world, spawning a wall along the water’s path. ALT FIRE while bending to stop the water early. Players hit are SLOWED'),
 (21,'Cascade','EQUIP a wave of water. FIRE to send the wave rolling forward and through walls. RE- USE to stop the wave. Players hit are SLOWED.'),
 (21,'Reckoning','EQUIP the full power of your Artifact. FIRE to summon a geyser pool on the ground. Enemy players in the area are targeted by successive geyser strikes. Players caught within a strike are CONCUSSED.'),
 (22,'Wingman','EQUIP Wingman FIRE to send Wingman forward seeking enemies. Wingman unleashes a concussive blast toward the first enemy he sees ALT FIRE when targeting a Spike site or planted Spike to have Wingman defuse or plant the Spike. To plant, Gekko must have the Spike in his inventory. When Wingman expires he reverts into a dormant globule INTERACT to reclaim the globule and gain another Wingman charge after a short cooldown.'),
 (22,'Dizzy ','EQUIP Dizzy FIRE to send Dizzy soaring forward through the air. Dizzy charges then unleashes plasma blasts at enemies in line of sight. Enemies hit by her plasma are blinded. When Dizzy expires she reverts into a dormant globule INTERACT to reclaim the globule and gain another Dizzy charge after a short cooldown.'),
 (22,'Mosh Pit','EQUIP Mosh FIRE to throw Mosh like a grenade ALT FIRE to throw underhand. Upon landing Mosh duplicates across a large area then after a short delay explodes.'),
 (22,'Thrash','EQUIP Thrash FIRE to link with Thrash’s mind and steer her through enemy territory ACTIVATE to lunge forward and explode, detaining any enemies in a small radius. When Thrash expires she reverts into a dormant globule INTERACT to reclaim the globule and gain another Thrash charge after a short cooldown. Thrash can be reclaimed once.'),
 (23,'Sonic Sensor','EQUIP a Sonic Sensor. FIRE to deploy. The sensor monitors an area for enemies making sound. It concusses that area if footsteps, weapons fire, or significant noise are detected.'),
 (23,'Barrier Mesh','EQUIP a Barrier Mesh disc. FIRE to throw forward. Upon landing, the disc generates barriers from the origin point that block character movement.'),
 (23,'Gravnet','EQUIP a GravNet grenade. FIRE to throw. ALT FIRE to lob the grenade underhand. The GravNet detonates upon landing, forcing any enemies caught within to crouch and move slowly.'),
 (23,'Annihilation','EQUIP a Nanowire Accelerator. FIRE to unleash a pulse of nanowires that captures the first enemy contacted. The cocooned enemy is pulled along a nanowire path and will die if they reach the end, unless they are freed. The nanowire cocoon is destructible.'),
 (24,'Undercut','EQUIP a molecular bolt. Fire to throw it forward, applying a brief FRAGILE to all players it touches. The bolt can pass through solid objects, including walls.'),
 (24,'Double Tap','START a focus timer. Once completed, enter a flow state during which downed enemies you kill or damage generate an energy orb. Shooting this orb grants you a shield which absorbs one instance of damage from any source.'),
 (24,'Contigency','EQUIP to assemble prismatic energy. FIRE to push an indestructible wall of energy forward that blocks bullets.'),
 (24,'Kill Contract','EQUIP an interdimensional arena. FIRE to hurl a column of energy through the battlefield, pulling you and the first enemy hit into the arena. You and your opponent duel to the death.');
COMMIT;
