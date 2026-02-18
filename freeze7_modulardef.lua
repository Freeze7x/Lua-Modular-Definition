---@meta

--[[
    Version: 1.0.2
    Modular Version: 4.2.1 (Probably)
--]]

--#region Aliases

---@alias Sin
---| "CRIMSON"
---| "SCARLET"
---| "AMBER"
---| "SHAMROCK"
---| "AZURE"
---| "INDIGO"
---| "VIOLET"

---@alias AttackType
---| "Hit"
---| "Penetrate"
---| "Slash"

---@alias SinRes
---| "resCRIMSON"
---| "resSCARLET"
---| "resAMBER"
---| "resSHAMROCK"
---| "resAZURE"
---| "resINDIGO"
---| "resVIOLET"

---@alias ModularBoolean
---| 1
---| 0

---@alias TargetSample
---| "Self"
---| "MainTarget"
---| string

--#endregion

--#region Acquisition

--- @param getAs "normal" | "%" | "max" | "missing" | "missing%" -- Changes return value to match (Percents are rounded down).
--- @param target TargetSample
--- @return integer
--- Returns the HP value from a target.
function hpcheck(target, getAs) return 0 end;

--- @param target TargetSample
--- @return integer
--- Returns the MP/SP value from a target.
function mpcheck(target) return 0 end;

--- @param buffKeyword string
--- @param mode "stack" | "turn" | "+" | "*" | "consumed" -- potency, count, potency + count, potency × count, total consumed amount.
--- @param target TargetSample
--- @return integer
--- Returns a specified buff's property from a target.
function bufcheck(target, buffKeyword, mode) return 0 end

--- @return integer
--- Returns the damage dealt from "OnSucceedAttack" and "WhenHit" timings.
function getdmg() return 0 end

--- @return integer
--- Returns the current turn number.
function round() return 0 end

--- @return integer
--- Returns the current wave number.
function wave() return 0 end

--- @return integer
--- Returns the number of times this script has been called.\
--- First time = 0.
function activations() return 0 end

--- @param target TargetSample
--- @return -1 | 0 | 1 | 2 -- -1 if the unit doesn't exist, 0 if the unit is dead, 1 if the unit is alive, and 2 if the unit is staggered.
--- Returns the unit state as a number (-1, 0, 1, 2).
function unitstate(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the unitID of a target.
function getid(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the characterID for a target (Sinners only).
function getcharacterid(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the unique instance ID for a target.
function instid(target) return 0 end

--- @param target TargetSample
--- @param slotIndex? integer -- Check a specific slot's speed instead.
--- @return integer
--- Returns the speed of a target.
function speedcheck(target, slotIndex) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the pattern index of the target.
function getpattern(target) return 0 end

--- @param dataId integer
--- @param target TargetSample
--- @return integer
--- Get encounter-persistent data from the target.
function getdata(target, dataId) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the amount of dead units who were allied with the target.
function deadallies(target) return 0 end

--- @param min integer
--- @param max integer
--- @return integer
--- Returns a random integer between min and max (both inclusive).
function random(min, max) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the current shield amount on the target.
function getshield(target) return 0 end

--- @param target2 TargetSample
--- @param target1 TargetSample
--- @return ModularBoolean
--- Returns whether two targets are allied (1) or enemies (0).
function areallied(target1, target2) return 0 end

--- @return integer
--- Returns the id of the skill currently being used.\
--- Will not work on timings that do not have skills being used.
function getskillid() return 0 end

--- @param target TargetSample
--- @param get "cur" | "og" -- Current coin count | Original coin count
--- @return integer
--- Returns the coinIndex count for a target.
function getcoincount(target, get) return 0 end

--- @param get "full" | "headcount" | "tailcount"
--- @param target TargetSample
--- @return integer
--- Returns how many coins flipped a specific side.\
--- "full" will return 1 if all Heads, 2 if all Tails, and 0 if mixed.
function allcoinstate(target, get) return 0 end

--- @param type "highres" | "highperfect" | Sin | "perfectCRIMSON" | "perfectSCARLET" | "perfectAMBER" | "perfectSHAMROCK" | "perfectAZURE" | "perfectINDIGO" | "perfectVIOLET"
--- @return integer
--- Returns the resonance count of the given type.\
--- "highres" and "highperfect" will return the highest resonance.
function resonance(type) return 0 end

--- @param target TargetSample
--- @param mode "AND" | "OR"
--- @param ... string -- Keywords to check for.
--- @return ModularBoolean
--- Checks whether the target has one or more keywords.
function haskey(target, mode, ...) return 0 end

--- @param type Sin
--- @param enemy? "Enemy" -- Return the enemy's resources instead. This is only used during Envy Peccatulum battles as of yet.
--- @return integer
--- Returns the amount of available sin resources.
function resource(type, enemy) return 0 end;

--- @param target TargetSample
--- @return integer
--- Returns the current skill's base power.
function skillbase(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the current skill's attack weight.
function skillatkweight(target) return 0 end

--- @param target TargetSample
--- @param coinIndex integer
--- @return integer
--- Returns the current skill's coin power at the given index.
function onescale(target, coinIndex) return 0 end

--- @param target TargetSample
--- @param coinIndex integer
--- @return integer
--- Returns the current skill's offense correction (+5, -5, +3, etc.).
function skillatklevel(target, coinIndex) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the current skill's offense correction + the unit's offense level.
function getskilllevel(target) return 0 end

--- @param target TargetSample
--- @return 0 | 1 | 2 | 3 -- 0 = Slash, 1 = Pierce, 2 = Blunt, 3 = None
--- Returns the current skill's attack type.
function skillatk(target) return 0 end

--- @param target TargetSample
--- @return 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 -- 0 = Wrath, 1 = Lust, 2 = Sloth, 3 = Gluttony, 4 = Gloom, 5 = Pride, 6 = Envy, 7 = White, 8 = Black, 9 = Red, 10 = Pale, 11 = Neutral.
--- Returns the current skill's sin affinity.
function skillattribute(target) return 0 end

--- @param target TargetSample
--- @return 0 | 1 | 2 | 3 | 4 | 5 -- 0 = None, 1 = Guard, 2 = Evade, 3 = Counter, 4 = Attack, 5 = Non Action
--- Returns the current skill's defense type (if any).
function skilldeftype(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the tier of the current skill, usually 1~3.
function skillrank(target) return 0 end

--- @param target TargetSample
--- @return 0 | 1 | 2 | 3 | 4 | 5 | 6 -- 0 = Skill, 1 = Awaken, 2 = Corrosion, 3 = Corrosion Unstable, 4 = Corrosion Stable, 5 = Upgrade, 6 = None.
--- Returns the current skill's Ego Type (if any).
function skillegotype(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the number of attacks the target is being targeted by.
function amountattacks(target) return 0 end

--- @return ModularBoolean
--- Returns whether the coin this script is on is broken.
function coinisbroken() return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the amount of skill slots the target has.
function skillslotcount(target) return 0 end

--- @return ModularBoolean
--- Returns 1 if the battle is a focused encounter, 0 if it is a regular encounter.
function isfocused() return 0 end

--- @param target TargetSample
--- @param mode "prev" | "current" -- Last Turn | Current Turn
--- @return integer
--- Returns the amount of damage taken by the target.
function getdmgtaken(target, mode) return 0 end

--- @param target TargetSample
--- @param mode "neg" | "pos" -- Filter to only count positive or negative buffs.
--- @return integer
--- Returns the count of buffs on the target, with optional filtering for negative/positive buffs.
function getbuffcount(target, mode) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the amount of units matching the target selector.\
--- Example: unitcount(NoParts99) would return the amount of enemies alive.
function unitcount(target) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the amount of stagger bars on the target.
function breakcount(target) return 0 end

--- @param target TargetSample
--- @param index integer? -- Stagger bar index (0 would be the first Stagger bar).
--- @return integer
--- Returns the HP value that a target's stagger bar lies.
function breakvalue(target, index) return 0 end

--- @param param "dayofweek" | "dayofmonth" | "dayofyear" | "hours" | "minutes" | "seconds" | "milliseconds" | "ticks" | "month" | "year" | "isleapyear"
--- @param leapYear integer?
--- @return integer
--- Returns requested time component or leap-year info.\
--- they are going to kill themselves, they do not know why this exists. 🦅
function timeget(param, leapYear) return 0 end

--- @param target TargetSample
--- @param statName "deployment" | "deadAllyCount" | SinRes | "panicType" | "isRetreated" | "speedMin" | "speedMax" | "speedMinOG" | "speedMaxOG" | "hasMP" | "deflevel"
--- @return integer
--- Retrieves a property value from the target.
function getstat(target, statName) return 0 end

--- @return ModularBoolean
--- Returns whether the coin was reused.
function coinrerolled() return 0 end

--- @param var1 integer
--- @param add "add"
--- @return integer
--- Gets the stage extra slot.
function stageextraslot(var1, add) return 0 end

--- @param get "available" | "spent"
--- @return integer
--- Returns the current bloodfeast available or consumed.
function getbloodfeast(get) return 0 end

--- @param target TargetSample
--- @return integer
--- Returns the level of the target.
function getlevel(target) return 0 end

--- @param target TargetSample
--- @return ModularBoolean
--- Returns if the coin this script is attached to is unbreakable.
function isunbreakable(target) return 0 end

--- @param target TargetSample
--- @return ModularBoolean
--- Returns if the coin this script is attached to is usable in a clash.
function isusableinduel(target) return 0 end

--- @param target1 string
--- @param target2 string
--- @return ModularBoolean
--- Returns whether both selectors refer to the exact same unit.
function sameunit(target1, target2) return 0 end

--- @param target TargetSample
--- @return ModularBoolean
--- Returns whether the target's skill is clashable.
function skillcanduel(target) return 0 end

--- @param target TargetSample
--- @return ModularBoolean
--- Returns whether the target's skill can kill their allies.
function skillteamkill(target) return 0 end

--- @param target TargetSample
--- @return ModularBoolean
--- Returns whether the target's skill cannot be redirected.
function skillfixedtarget(target) return 0 end

--#endregion

--#region Consequence

--- @param msg string
--- @param int? integer
--- Prints a line in the BepInEx Log with the provided VALUE.
function log(msg, int) end

--- @param target TargetSample
--- @param value integer
--- @param atkType -1 | 0 | 1 | 2 -- True (-1) | Slash | Pierce | Blunt
--- @param sinType -1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 -- True (-1) | Wrath | Lust | Sloth | Gluttony | Gloom | Pride | Envy | White | Black | Red | Pale | Neutral
--- Deals fixed sin affinity and attack type damage to the target.
function bonusdmg(target, value, atkType, sinType) end

--- @param target TargetSample
--- @param value integer
--- [IMPORTANT] Despite its name, this will increase sanity rather than decrease it.\
--- Heal/Damage SP on the target by the given value.
function mpdmg(target, value) end

--- @param target TargetSample
--- @param buffKeyword string
--- @param potency integer
--- @param count integer
--- @param activeRound 0 | 1 | 2 This Turn | Next Turn | Both
--- @param consume? "use" -- Attempt to "consume" the buff instead of removing it.
--- Inflicts, modifies, or consumes a buff on the target specified by keyword. Negative potency/count can be used to consume the buff instead.
function buf(target, buffKeyword, potency, count, activeRound, consume) end

--- @param target TargetSample
--- @param amount integer
--- @param persist? "perm" -- Prevents the shield from decaying at round end.
--- Applies shield to the target.
function shield(target, amount, persist) end

--- @param target TargetSample
--- @param value integer|string -- exact HP value or 'X%'.
--- Heals HP on the specified target by value or percent. Negative values deal true HP damage (like bleed).
function healhp(target, value) end

--- @param target TargetSample
--- @param value integer -- How many times to trigger.
--- Triggers Tremor Burst on the target.
function explosion(target, value) end

--- @param target TargetSample
--- @param value integer
--- @param times integer? -- How many times to trigger.
--- Raise stagger threshold by the value, negative values "heal" stagger.
function breakdmg(target, value, times) end

--- @param target TargetSample
--- Because break is a reserved word in lua for breaking out of a loop, the break() modular function cannot work in lua.\
--- DO NOT TRY TO USE THIS FUNCTION AS AN ALTERNATIVE, IT IS HERE FOR INFORMATION ONLY.
function breakREADMEIFTRYINGTOSTAGGERTARGET(target) end

--- @param target TargetSample
--- Recover from stagger.
function breakrecover(target) end

--- @param target TargetSample
--- @param value integer|string -- exact HP value or 'X%'.
--- Adds a new Stagger Threshold. Value may be an exact HP number or percent of max HP.\
--- Setting above max HP causes stagger on next hit.
function breakaddbar(target, value) end

--- @param value integer
--- @param operatorChangeOrIndex "ADD" | "SUB" | "MUL" | integer -- If this is an integer, chooses a specific coin.
--- Modifies coin scale/power or operator type. value adds/subtracts coin power; operatorChangeOrIndex can change operator type ("ADD"/"SUB"/"MUL") or target a specific coin index.
function scale(value, operatorChangeOrIndex) end

--- @param value integer
--- Add/Subtract base power from current skill.
function base(value) end

--- @param value integer
--- Add/Subtract final power from current skill.
function final(value) end

--- @param value integer
--- Add/Subtract clash power from current skill.
function clash(value) end

--- @param value integer
--- Adds a flat damage addition to the current skill.
function dmgadd(value) end

--- @param value integer
--- Gain +Damage% on a skill.
function dmgmult(value) end

--- @param value integer
--- Sets the pattern index for the target. (WIP)
function pattern(value) end

--- @param target TargetSample
--- @param dataId integer
--- @param value integer
--- Sets encounter-persistent numeric data on the target for the given dataId.
function setdata(target, dataId, value) end

--- @param skillId integer
--- Changes the active skill of the unit to the provided skill id.\
--- The skill must be in the unit's arsenal.
function changeskill(skillId) end

--- @param ... integer Coin indices to reuse.
--- Reuses the specified coin indices during the attack (-1 targets the coin script itself).\
--- May not work on OnSucceedAttack timing, wait for a fix.
function reusecoin(...) end

--- @param target TargetSample
--- @param value integer
--- @param turn? "this" | "next" -- Default: "next"
--- @param slotApplication? -2 | -1 | integer -2 = Slot this script is used on, -1 = All slots, >=0 = A specific slot index.
--- Adds aggro to the target across slots.
function aggro(target, value, turn, slotApplication) end

--- @param target TargetSample
--- Reuses the current skill against all targets given.
function skillreuse(target) end

--- @param attacker TargetSample
--- @param victim TargetSample
--- @param skillId string|integer
--- @param defense? "def" Used to force defensive handling, provide this parameter if a defense skill does not work.
--- Sends a skill from attacker to victim.\
--- The skill must exist in the attacker's arsenal.
function skillsend(attacker, victim, skillId, defense) end

--- @param slotIndex integer | "All"
--- @param skillIdLost integer | "All" -- Skill to replace.
--- @param skillIdGiven integer -- Skill to replace with.
--- Replaces the skills in the given slots with another skill.\
--- Will log errors for invalid indices, or if the target-selector "Self" is invalid in this context.
function skillslotreplace(slotIndex, skillIdLost, skillIdGiven) end

--- @param target TargetSample
--- @param value integer
--- Add/Subtracts from the unit's maxActionSlotNum (Abno only).
function setslotadder(target, value) end

--- @param type Sin
--- @param amount integer
--- @param enemy? "Enemy" -- Adjust the enemy's resources instead. This is only used during Envy Peccatulum battles as of yet.
--- @return integer
--- Adds/Subtracts from the available sin resources.
function resource(type, amount, enemy) return 0 end;

--- @param mode "DESCENDING"|"ASCENDING"|"RANDOM" -- "DESCENDING" = highest tier, "ASCENDING" = lowest tier
--- @param amount integer
--- Discards skills from the target.
function discard(mode, amount) end

--- @param target TargetSample
--- @param passiveId integer
--- Adds a passive to the selected units by passive id.
function passiveadd(target, passiveId) end

--- @param target TargetSample
--- @param passiveId integer
--- Removes the specified passive from the selected units.
function passiveremove(target, passiveId) end

--- Ends the stage immediately.
function endstage() end

--- Ends the current turn immediately.
function endbattle() end

--- @param value ModularBoolean
--- Sets whether the skill can be used for clashing.
function skillcanduel(value) end

--- @param target TargetSample
--- @param passiveId integer | "all"
--- Reveals passives on the target.
function passivereveal(target, passiveId) end

--- @param target TargetSample
--- @param skillId integer | "all"
--- Reveals the skills on the target.
function skillreveal(target, skillId) end

--- @param target TargetSample
--- @param bodyPartId integer
--- @param resType Sin | AttackType
--- @param resTypeType "type" | "attribute" -- Use "type" if resType is an attack type, and "attribute" when resType is a sin.
--- Reveals resistance info of the target.
function resistreveal(target, bodyPartId, resType, resTypeType) end

--- @param target TargetSample
--- @param appearanceId integer | string
--- Changes the appearance of the target.\
--- Note: This will always activate at combat start because of how the game handles visuals.
function appearance(target, appearanceId) end

--- @param ... integer -- Coin indices to cancel.
--- Cancels the specified coin indices (similar to cancel when no ammo).
function coincancel(...) end

--- @param target TargetSample
--- Gives a skill slot to the target (Sinners only).
function skillslotgive(target) end

--- @param assistantId integer
--- @param level integer
--- @param uptie integer
--- Summons an assistant next turn with the given level and uptie.\
--- [NOTE] Avoid RoundStart timing, use EndBattle instead.
function summonassistant(assistantId, level, uptie) end

--- @param enemyId integer
--- @param level integer
--- @param uptie integer
--- @param waveIndex integer
--- @param regularEncounter? "enemy" -- Forces a regular encounter spawn instead of an abnormality.
--- Summons an enemy or abnormality next turn with provided parameters.\
--- [NOTE] Avoid RoundStart timing, use EndBattle instead.
function summonenemy(enemyId, level, uptie, waveIndex, regularEncounter) end

--- Summons the units from the subunitList.
function summonunitfromqueue() end

--- @param target TargetSample
--- i am gnoming it so good
function gnome(target) end

--- @param target TargetSample
--- @param buffKeyword string
--- @param superPosition? "superpos" -- Enable Superposition behavior.
--- Tremor Conversion into the provided buff.
function vibrationswitch(target, buffKeyword, superPosition) end

--- @param value ModularBoolean
--- Used with Immortal timings. If set to 1 when a unit would die, the unit remains at 1 HP instead.
function setimmortal(value) end

--- @param mapName string
--- @param mapSize integer
--- Changes the current map/background and size.
function changemap(mapName, mapSize) end

--- @param target TargetSample | "upper" -- The special exclusive targeting "upper" can display top-screen text instead.
--- @param dialog string -- Use _ instead of spaces.
--- Shows a battle dialog bubble for the target. Use '_' for spaces.
function battledialogline(target, dialog) end

--- @param target TargetSample
--- @param vfx string
--- @param active ModularBoolean
--- @param layerType "NONE"|"DIRECTION"|"ONCE"|"BACK"|"SKIN"
--- Toggles a visual effect label around the target.
function effectlabel(target, vfx, active, layerType) end

--- @param target TargetSample
--- @param active ModularBoolean
--- deploy the sensational superlative sanguine sancho shield. 🦅🦅🦅🦅🦅\
--- [NOTE] Only works for 8380_SanchoAppearance and 1079_Sancho_BerserkAppearance. Might not work for 10310_Donquixote_DarkSanchoAppearance.
function sanchoshield(target, active) end

--- @param target TargetSample
--- @param buffKeyword string -- What appears on the unit when they retreat (e.g., Overwatch Assignment).
--- Queues the target to retreat at turn end.
function retreat(target, buffKeyword) end

--- @param type "bgm" | "sfx" | "voice" | "announcer"
--- @param toPlay? string
--- Play a given SFX, BGM, Voice line, or Announcer line.
function sound(type, toPlay) end

--- @param target TargetSample
--- @param value integer
--- Triggers Sinking Deluge.
function surge(target, value) end

--- @param target TargetSample
--- @param ability string
--- @param stack integer
--- @param turn integer
--- @param activeRound 0 | 1 | 2
--- Adds a unique system ability to the target.
function addability(target, ability, stack, turn, activeRound) end

--- @param target TargetSample
--- @param ability string
--- Removes a unique system ability from the target.
function removeability(target, ability) end

--- @param color "reserved" | string -- Leave as reserved until fixed.
--- @param text string
--- Displays lyrics on the stage that Mili songs use.
function lyrics(color, text) end

--- @param color string
--- @param text string
--- Shows upper screen text in the UI with specified color.
function uppertext(color, text) end

--- @param ... integer | "all" -- The coins to make unbreakable, -1 to target the coin this script is on.
--- Makes the specified coins unbreakable.
function makeunbreakable(...) end

--- @param var1 integer
--- @param add? "add" -- Add to the value instead of setting.
--- Sets the stage extra slot to a specific value.
function stageextraslot(var1, add) end

--- @param mode "add" | "sub" | "spend"
--- @param value integer
--- @param target? TargetSample
--- Modifies bloodfeast resource: add/sub/spend value. "spend" requires a target to consume for.
function bloodfeast(mode, value, target) end

--- @param value integer -- Percent chance to add. (15 => +15% chance)
--- Add to the chance of a critical hit.
function critchance(value) end

--- @param defender "Defender" | TargetSample
--- @param defended "Defended" | TargetSample
--- @param skillId integer -- Skill to defend with. Must be in the unit's defense skill list.
--- Defends a unit based on the parameters.\
--- Note: The defender Skill must have the Skill ability "SupportiveDefense", and the unit defending must have a buff with the ability "SupportProtect" (Mao Faust assist defense).
function assistdefense(defender, defended, skillId) end

--- @param value ModularBoolean
--- Disables/Enables panic for the target.
function ignorepanic(value) end

--- @param value ModularBoolean
--- Disables/Enables stagger for the target.
function ignorebreak(value) end

--- @param motionType "Default" | "Dead" | "Evade" | "Guard" | "Damaged" | "Move" | "Attack" | "S1" | "S2" | "S3" | "S4" | "S5" | "S6" | "S7" | "S8" | "S9" | "S10" | "Parrying" | "Idle" | "Parrying_Range" | "Special1" | "Special2" | "Special3" | "S11" | "S12" | "S13" | "S14" | "S15" | "S16" | "S17" | "S18" | "S19" | "S20" | "S21" | "Empty"
--- @param motionIndex integer
--- Changes a skill's motion/animation type and index (e.g., S1..S20 and index).
function changemotion(motionType, motionIndex) end

--- @param value? integer
--- @return integer
--- Buff-exclusive consequence.\
--- Add/Subtract potency from the buff.\
--- Returns the potency of buff.
function stack(value) return 0 end

--- @param value? integer
--- Buff-exclusive consequence.\
--- Add/Subtract count from the buff.\
--- Returns the count of buff.
function turn(value) return 0 end

--#region Lua Exclusive

--- @param target TargetSample
--- @param dataId string
--- @param value any
--- Lua-exclusive consequence.\
--- Sets encounter-persistent data from the target.
function setldata(target, dataId, value) end

--- @param target TargetSample
--- @param dataId string
--- @return any
--- Lua-exclusive consequence.\
--- Gets encounter-persistent data from the target.
function getldata(target, dataId) end

--- Clears the values of a Modular script.
function clearvalues() end

--- Clears the adders of a Modular script.
function resetadders() end

--- @param selector string
--- @return string[] -- An array of inst ids, e.g. {"inst12","inst34"}
--- Takes a multi-target selector string and returns an array of selected targets (i.e. ["inst12", "inst34"]).\
--- Inst selectors are recognized by Modular, meaning you can pass them into consequence/value acquirers that accept target selectors.
function selecttargets(selector) return {} end

--#endregion

--#endregion
