---@meta

--[[
    Version: 1.1.1
    Modular Version: 4.4.0
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

---@alias Virtues
---| "RED"
---| "WHITE"
---| "BLACK"
---| "PALE"

---@alias AttackType
---| "Hit"
---| "Penetrate"
---| "Slash"

---@alias AttackTypeCaps
---| "HIT"
---| "PENETRATE"
---| "SLASH"

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

---@alias TargetSingle
---| "Self"
---| "MainTarget"
---| "adjLeft"
---| "adjRight"
---| string

---@alias TargetMulti
---| "Self"
---| "MainTarget"
---| "EveryTarget"
---| "All"
---| "adjLeft"
---| "adjRight"
---| string

---@alias BuffCategory
---| "Neutral"
---| "Positive"
---| "Negative"
---| "SIN"
---| "RESOURCE"
---| "SHIELD_MANAGER"
---| "BREATH"
---| "CHARGE"
---| "COMBUSTION"
---| "LACERATION"
---| "VIBRATION"
---| "BURST"
---| "SINKING"
---| "BULLET"
---| "CAN_GET_ONLY_BY_SYSTEM"
---| "AACFPBBCA"
---| "FREISHUTZ_OUTIS_EGO_BULLET"
---| "DUEL_DECLARATION"
---| "CONCENTRATED_ATTACK"
---| "DIANXUE"
---| "BURSTREACTIVE"
---| "IGNORE_CHECED_CORRECTION_EXCLUSION"
---| "TURN_IS_ALSO_LOADED_BULLET"
---| "VIBRATION_CONVERTED"
---| "VIBRATION_MERGED"
---| "SUPPORTIVE_PROTECT"

--#endregion

--#region Acquisition

--- @param getAs "normal" | "%" | "max" | "missing" | "missing%"
--- @param target TargetSingle
--- @return integer
--- Returns the HP value from a target.\
--- Percents are returned normalized to 100, and are rounded down.\
--- Examples: 40% -> 40 | 45.3% -> 45 | 87.9% -> 87
--- @nodiscard
function hpcheck(target, getAs) return 0 end;

--- @param target TargetSingle
--- @return integer
--- Returns the MP/SP value from a target.\
--- Abnormalities will always return 0.
--- @nodiscard
function mpcheck(target) return 0 end;

--- @param buffKeyword string
--- @param mode "stack" | "turn" | "+" | "*" | "consumed" -- "stack" = Potency, "turn" = Count, "+" = potency + count, "*" = potency × count, "consumed" = total consumed amount.
--- @param target TargetSingle
--- @return integer
--- Returns a specified buff's property from a target.
--- @nodiscard
function bufcheck(target, buffKeyword, mode) return 0 end

--- @return integer
--- Returns the damage dealt from "OnSucceedAttack" and "WhenHit" timings.
--- @nodiscard
function getdmg() return 0 end

--- @return integer
--- Returns the current turn number.
--- @nodiscard
function round() return 0 end

--- @return integer
--- Returns the current wave number.
--- @nodiscard
function wave() return 0 end

--- @return integer
--- [NOTE] This always return 0 in Lua scripts.\
--- Returns the number of times a Modular script has been called.\
--- First time = 0.\
--- @nodiscard
function activations() return 0 end

--- @param target TargetSingle
--- @return -1 | 0 | 1 | 2
--- Returns the unit state as an integer.\
--- -1: Unit doesn't exist.\
--- 0: Unit is dead.\
--- 1: Unit is alive.\
--- 2: Unit is staggered.
--- @nodiscard
function unitstate(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the unitID of a target.
--- @nodiscard
function getid(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the characterID for a target (Sinners only).
--- @nodiscard
function getcharacterid(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the unique instance ID for a target.
--- @nodiscard
function instid(target) return 0 end

--- @param target TargetSingle
--- @param slotIndex? integer -- Check a specific slot's speed instead.
--- @return integer
--- Returns the speed of a target.
--- @nodiscard
function speedcheck(target, slotIndex) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the pattern index of the target.
--- @nodiscard
function getpattern(target) return 0 end

--- @param dataId integer
--- @param target TargetSingle
--- @return integer
--- Gets encounter-persistent numeric data from the target that was set using setdata().\
--- If the data will not be used outside of the Lua scope (i.e., in Modular scripts),\
--- it is preferable to use setldata() and getldata() instead.
--- @see setdata
--- @nodiscard
function getdata(target, dataId) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the amount of dead units who were allied with the target.
--- @nodiscard
function deadallies(target) return 0 end

--- @param min integer
--- @param max integer
--- @return integer
--- Returns a random integer between min and max (both inclusive).
--- @nodiscard
function random(min, max) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the current shield amount on the target.
--- @nodiscard
function getshield(target) return 0 end

--- @param target1 TargetSingle
--- @param target2 TargetSingle
--- @return ModularBoolean
--- Returns whether two targets are allied (1) or enemies (0).
--- @nodiscard
function areallied(target1, target2) return 0 end

--- @return integer
--- Returns the id of the skill currently being used.\
--- Will not work on timings that do not have skills being used.
--- @nodiscard
function getskillid() return 0 end

--- @param target TargetSingle
--- @param get "cur" | "og" -- Current coin count | Original coin count
--- @return integer
--- Returns the coinIndex count for a target.
--- @nodiscard
function getcoincount(target, get) return 0 end

--- @param get "headcount" | "tailcount"
--- @param target TargetSingle
--- @return integer
--- Returns how many coins flipped a specific side.
--- @nodiscard
function allcoinstate(target, get) return 0 end

--- @param get "full"
--- @param target TargetSingle
--- @return 0 | 1 | 2
--- Returns if all the coins matched the same side, as well as what side they all matched.\
--- 0: Mixed | 1: All Heads | 2: All Tails
--- @nodiscard
function allcoinstate(target, get) return 0 end

--- @param type "highres" | "highperfect" | Sin | "perfectCRIMSON" | "perfectSCARLET" | "perfectAMBER" | "perfectSHAMROCK" | "perfectAZURE" | "perfectINDIGO" | "perfectVIOLET"
--- @return integer
--- Returns the resonance count of the given type.\
--- "highres" and "highperfect" will return the highest resonance.
--- @nodiscard
function resonance(type) return 0 end

--- @param target TargetSingle
--- @param mode "AND" | "OR"
--- @param ... string -- Keywords to check for.
--- @return ModularBoolean
--- Checks whether the target has one or more keywords.
--- @nodiscard
function haskey(target, mode, ...) return 0 end

--- @param type Sin
--- @param enemy? "Enemy" -- Return the enemy's resources instead. This is only used during Envy Peccatulum battles as of yet.
--- @return integer
--- Returns the amount of available sin resources.
--- @nodiscard
function resource(type, enemy) return 0 end;

--- @param target TargetSingle
--- @return integer
--- Returns the current skill's base power.
--- @nodiscard
function skillbase(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the current skill's attack weight.
--- @nodiscard
function skillatkweight(target) return 0 end

--- @param target TargetSingle
--- @param coinIndex integer -- The coin to get the coin power forww
--- @return integer
--- Returns the current skill's coin power.
--- @nodiscard
function onescale(target, coinIndex) return 0 end

--- @param target TargetSingle
--- @param coinIndex integer
--- @return integer
--- Returns the current skill's level correction (+5, -5, +3, etc.).
--- @nodiscard
function skillatklevel(target, coinIndex) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the current skill's level correction + the unit's offense level.
--- @nodiscard
function getskilllevel(target) return 0 end

--- @param target TargetSingle
--- @return 0 | 1 | 2 | 3
--- Returns the current skill's attack type.\
--- 0: Slash | 1: Pierce | 2: Blunt | 3: None
--- @nodiscard
function skillatk(target) return 0 end

--- @param target TargetSingle
--- @return 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11
--- Returns the current skill's sin affinity as an integer between 0 and 11.\
--- 0: Wrath | 1: Lust | 2: Sloth | 3: Gluttony | 4: Gloom | 5: Pride | 6: Envy | 7: White | 8: Black | 9: Red | 10: Pale | 11: Neutral
--- @nodiscard
function skillattribute(target) return 0 end

--- @param target TargetSingle
--- @return 0 | 1 | 2 | 3 | 4 | 5
--- Returns the current skill's defense type (if any).\
--- 0: None | 1: Guard | 2: Evade | 3: Counter | 4: Attack | 5: Non-Action
--- @nodiscard
function skilldeftype(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the tier of the current skill, usually 1~3.
--- @nodiscard
function skillrank(target) return 0 end

--- @param target TargetSingle
--- @return 0 | 1 | 2 | 3 | 4 | 5 | 6
--- Returns the current skill's E.G.O. type (if any).\
--- 0: Skill | 1: Awaken | 2: Corrosion | 3: Corrosion Unstable | 4: Corrosion Stable | 5: Upgrade | 6: None
--- @nodiscard
function skillegotype(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the number of attacks the target is being targeted by.
--- @nodiscard
function amountattacks(target) return 0 end

--- @return ModularBoolean
--- Returns whether the coin this script is on is broken.
--- @nodiscard
function coinisbroken() return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the amount of skill slots the target has.
--- @nodiscard
function skillslotcount(target) return 0 end

--- @return ModularBoolean
--- Returns 1 if the battle is a focused encounter, 0 if it is a regular encounter.
--- @nodiscard
function isfocused() return 0 end

--- @param target TargetSingle
--- @param mode "prev" | "current" -- Last Turn | Current Turn
--- @return integer
--- Returns the amount of damage taken by the target.
--- @nodiscard
function getdmgtaken(target, mode) return 0 end

--- @param target TargetSingle
--- @param mode "neg" | "pos" -- Filter to only count positive or negative buffs.
--- @return integer
--- Returns the count of buffs of a type on the target.
--- @nodiscard
function getbuffcount(target, mode) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the amount of units matching the target selector.\
--- Example: unitcount(NoParts99) would return the amount of enemies alive.
--- @nodiscard
function unitcount(target) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the amount of stagger bars on the target.
--- @nodiscard
function breakcount(target) return 0 end

--- @param target TargetSingle
--- @param index integer? -- Stagger bar index (0 would be the first Stagger bar).
--- @return integer
--- Returns the HP value that a target's stagger bar lies.
--- @nodiscard
function breakvalue(target, index) return 0 end

--- @param param "dayofweek" | "dayofmonth" | "dayofyear" | "hours" | "minutes" | "seconds" | "milliseconds" | "ticks" | "month" | "year" | "isleapyear"
--- @param leapYear integer?
--- @return integer
--- Returns requested time component or leap-year info.\
--- [Combat Start] Gain 1 Clash Power Up for every 25 seconds that passed during the chaining phase (max 4)
--- @nodiscard
function timeget(param, leapYear) return 0 end

--- @param target TargetSingle
--- @param statName "deployment" | "deadAllyCount" | SinRes | "panicType" | "isRetreated" | "speedMin" | "speedMax" | "speedMinOG" | "speedMaxOG" | "hasMP" | "deflevel"
--- @return integer
--- Retrieves a property value from the target.
--- @nodiscard
function getstat(target, statName) return 0 end

--- @return ModularBoolean
--- Returns whether the coin was reused.
--- @nodiscard
function coinrerolled() return 0 end

--- @param var1 integer
--- @param add "add"
--- @return integer
--- Gets the stage extra slot.
--- @nodiscard
function stageextraslot(var1, add) return 0 end

--- @param get "available" | "spent"
--- @return integer
--- Returns the current bloodfeast available or consumed.
--- @nodiscard
function getbloodfeast(get) return 0 end

--- @param target TargetSingle
--- @return integer
--- Returns the level of the target.
--- @nodiscard
function getlevel(target) return 0 end

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns if the coin this script is attached to is unbreakable.
--- @nodiscard
function isunbreakable(target) return 0 end

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns if the coin this script is attached to is usable in a clash.\
--- 1 if uncracked, and 0 if cracked.
--- @nodiscard
function isusableinduel(target) return 0 end

--- @param target1 string
--- @param target2 string
--- @return ModularBoolean
--- Returns whether both selectors refer to the exact same unit.
--- @nodiscard
function sameunit(target1, target2) return 0 end

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns whether the target's skill is clashable.
--- @nodiscard
function skillcanduel(target) return 0 end

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns whether the target's skill can target their allies.
--- @nodiscard
function skillteamkill(target) return 0 end

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns whether the target's skill cannot be redirected.
--- @nodiscard
function skillfixedtarget(target) return 0 end

--- @param target TargetSingle
--- @return 1 | 2 | 3
--- Returns an integer representing the coin's operator type.\
--- 1: Plus Coin | 2: Minus Coin | 3: Multiply Coin
--- @nodiscard
function coinoperator(target, coinIndex) return 1 end

--- @param keyword string
--- @return 0 | 1 | 2
--- Returns an integer representing the buff's type.\
--- 0: Neutral | 1: Positive | 2: Negative
--- @nodiscard
function bufftype(keyword) return 1 end

--- @param target TargetSingle
--- @param atkType AttackTypeCaps
--- @return integer
--- Return an integer (normalized to 0~200) that represents the resistance to an attack type. (Doesn't work for abnormalities)\
--- (e.g., x0.75 -> 75).
--- @nodiscard
function getatkres(target, atkType) return 0 end;

--- @param target TargetSingle
--- @param sin Sin
--- @return integer
--- Return an integer (normalized to 0~200) that represents the resistance to a sin affinity. (Doesn't work for abnormalities)\
--- (e.g., x0.67 -> 67).
--- @nodiscard
function getsinres(target, sin) return 0 end;

--- @param target TargetSingle
--- @return ModularBoolean
--- Returns whether the unit used a defense skill or not this turn.
--- @nodiscard
function useddefaction(target) return 0 end;

--- @return 0 | 1 | 2 |3
--- Returns an integer representing the status of the chain of skills on the dashboard.\
--- 0: No skills could be found.\
--- 1: Only Offensive (Attack/Counter) skills are chained.\
--- 2: Only Defensive (Guard/Evade) skills are chained.\
--- 3: Both Offensive and Defensive skills are chained.
--- @nodiscard
function chainstatus() return 0 end;

--- @return 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
--- Returns an integer representing where the buff came from.\
--- 0: No source\
--- 1: Skill effect\
--- 2: Event\
--- 3: Another buff\
--- 4: Passive\
--- 5: System Ability\
--- 6: E.G.O. Gift\
--- 7: Pattern\
--- 8: Stage effect\
--- 9: A unit.
--- @nodiscard
function gbsource() return 0 end;

--- @return integer
--- Returns how much potency the gained buff received.
--- @nodiscard
function gbstack() return 0 end;

--- @return integer
--- Returns how much count the gained buff received.
--- @nodiscard
function gbturn() return 0 end;

--- @return 0 | 1 | 2
--- Returns the ActiveRound of the buff\
--- 0: This Turn | 1: Next Turn | 2: Both
--- @nodiscard
function gbturn() return 0 end;

--#endregion

--#region Consequence

--- @param msg string
--- @param int? integer
--- Prints a line in the BepInEx Log with the provided VALUE.
function log(msg, int) end

--- @param target TargetMulti
--- @param damage integer
--- @param atkType -1 | 0 | 1 | 2 -- True (-1) | Slash | Pierce | Blunt
--- @param sinType -1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 -- True (-1) | Wrath | Lust | Sloth | Gluttony | Gloom | Pride | Envy | White | Black | Red | Pale | Neutral
--- Deals fixed sin affinity and attack type damage to the target.
function bonusdmg(target, damage, atkType, sinType) end

--- @param target TargetMulti
--- @param amount integer
--- [IMPORTANT] Despite its name, this will increase sanity rather than decrease it.\
--- Heal/Damage SP on the target by the given value.
--- Do not use this on the "IgnorePanic" timing, as it will crash the game due to recursion.
function mpdmg(target, amount) end

--- @param target TargetMulti
--- @param buffKeyword string
--- @param potency integer
--- @param count integer
--- @param activeRound 0 | 1 | 2 This Turn | Next Turn | Both
--- @param consume? "use" -- Attempt to "consume" the buff instead of removing it.
--- Inflicts, modifies, or consumes a buff on the target specified by keyword. Negative potency/count can be used to consume the buff instead.
function buf(target, buffKeyword, potency, count, activeRound, consume) end

--- @param target TargetMulti
--- @param amount integer
--- @param persist? "perm" -- Prevents the shield from decaying at round end.
--- Applies shield to the target.
function shield(target, amount, persist) end

--- @param target TargetMulti
--- @param amount integer|string -- exact HP value or 'X%'.
--- Heals HP on the specified target by value or percent. Negative values deal true HP damage (like bleed).
function healhp(target, amount) end

--- @param target TargetMulti
--- @param times integer -- How many times to trigger.
--- Triggers Tremor Burst on the target.
function explosion(target, times) end

--- @param target TargetMulti
--- @param value integer
--- @param times integer? -- How many times to trigger.
--- Raise stagger threshold by the value, negative values "heal" stagger.
function breakdmg(target, value, times) end

--- @param target TargetMulti
--- This function does not work. Do not use it.
--- "break" is a reserved word in Lua for breaking out of a loop, so the function cannot be called.\
function _break(target) end

--- @param target TargetMulti
--- Recover from stagger.
function breakrecover(target) end

--- @param target TargetMulti
--- @param where integer|string -- exact HP value or 'X%'.
--- Adds a new Stagger Threshold. Value may be an exact HP number or percent of max HP.\
--- Setting above max HP causes stagger on next hit.
function breakaddbar(target, where) end

--- @param value integer | "ADD" | "SUB" | "MUL"
--- @param index? integer -- The index of the coin to be affected. If omitted, will affect all coins.
--- Add/Subtract coin power from current skill, or change the operatorType of the coins.
function scale(value, index) end

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

--- @param target TargetMulti
--- @param dataId integer
--- @param value integer
--- Sets encounter-persistent numeric data to the target that was set using setdata().\
--- If the data will not be used outside of the Lua scope (i.e., in Modular scripts),\
--- it is preferable to use setldata() and getldata() instead.
--- @see getdata
function setdata(target, dataId, value) end

--- @param skillId integer
--- Changes the active skill of the unit to the provided skill id.\
--- The skill must be in the unit's arsenal.
function changeskill(skillId) end

--- @param ... integer Coin indices to reuse.
--- Reuses the specified coin indices during the attack (-1 targets the coin script itself).\
--- Using on their OnSucceedAttack timing will result in the coins being generated on attack start rather than appearing when reused.
function reusecoin(...) end

--- @param target TargetMulti
--- @param value integer
--- @param turn? "this" | "next" -- Default: "next"
--- @param slotApplication? -2 | -1 | integer -2 = Slot this script is used on | -1 = All slots | 0 or greater = A specific slot index.
--- Adds aggro to the target across slots.
function aggro(target, value, turn, slotApplication) end

--- @param target TargetMulti
--- Reuses the current skill against all targets given.
function skillreuse(target) end

--- @param attacker TargetSingle
--- @param victim TargetMulti
--- @param skillId integer | string -- Any Skill ID, or S# and D# (e.g., S2, D1)
--- @param defense? "def" Provide this parameter if sending a defense skill does not work.
--- Sends a skill from attacker to victim.\
--- The skill must exist in the attacker's arsenal.
function skillsend(attacker, victim, skillId, defense) end

--- @param slotIndex integer | "All"
--- @param skillIdLost integer | "All" -- Skill to replace.
--- @param skillIdGiven integer -- Skill to replace with.
--- Replaces the skills in the given slots with another skill.\
--- Will log errors for invalid indices, or if the target-selector "Self" is invalid in this context.
function skillslotreplace(slotIndex, skillIdLost, skillIdGiven) end

--- @param target TargetMulti
--- @param value integer
--- Add/Subtracts from the unit's maxActionSlotNum (Abno only).
function setslotadder(target, value) end

--- @param type Sin
--- @param amount integer
--- @param enemy? "Enemy" -- Adjust the enemy's resources instead. This is only used during Envy Peccatulum battles as of yet.
--- @return integer
--- Adds/Subtracts from the available sin resources.
function resource(type, amount, enemy) return 0 end;

--- @param mode "DESCENDING"|"ASCENDING"|"RANDOM" -- "DESCENDING" = highest tier | "ASCENDING" = lowest tier
--- @param amount integer
--- Discards skills from the target.
function discard(mode, amount) end

--- @param target TargetMulti
--- @param passiveId integer
--- Adds a passive to the selected units by passive id.
function passiveadd(target, passiveId) end

--- @param target TargetMulti
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

--- @param target TargetMulti
--- @param passiveId integer | "all"
--- Reveals passives on the target.
function passivereveal(target, passiveId) end

--- @param target TargetMulti
--- @param skillId integer | "all"
--- Reveals the skills on the target.
function skillreveal(target, skillId) end

--- @param target TargetMulti
--- @param bodyPartId integer
--- @param resType Sin | AttackType
--- @param resTypeType "type" | "attribute" -- Use "type" if resType is an attack type, and "attribute" when resType is a sin.
--- Reveals resistance info of the target.
function resistreveal(target, bodyPartId, resType, resTypeType) end

--- @param target TargetMulti
--- @param appearanceId integer | string
--- Changes the appearance of the target.\
--- [NOTE] This will always activate at combat start because of how the game handles visuals.
function appearance(target, appearanceId) end

--- @param ... integer -- Coin indices to cancel.
--- Cancels the specified coin indices (similar to cancel when no ammo).
function coincancel(...) end

--- @param target TargetMulti
--- Gives a skill slot to the target (Sinners only).
function skillslotgive(target) end

--- @param target TargetMulti
--- @param index integer --- Slot index to remove, starts at 1.
--- Removes a skill slot from the target (Sinners only).
function skillslotremove(target, index) end

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

--- @param target TargetMulti
--- i am gnoming it so good
function gnome(target) end

--- @param target TargetMulti
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

--- @param target TargetMulti | "upper" -- The special exclusive targeting "upper" can display top-screen text instead.
--- @param dialog string -- Use _ instead of spaces.
--- Shows a battle dialog bubble for the target. Use '_' for spaces.
function battledialogline(target, dialog) end

--- @param target TargetMulti
--- @param vfx string
--- @param active ModularBoolean
--- @param layerType "NONE"|"DIRECTION"|"ONCE"|"BACK"|"SKIN"
--- @param isSetOverrideDie boolean
--- @param isCenter boolean
--- @param scale integer
--- @param isAddScript boolean
--- Toggles a visual effect label around the target.
function effectlabel(target, vfx, active, layerType, isSetOverrideDie, isCenter, scale, isAddScript) end

--- @param target TargetMulti
--- @param active ModularBoolean
--- deploy the sensational superlative sanguine sancho shield. (S.S.S.S.S.) 🦅🦅🦅🦅🦅\
--- [NOTE] Only works for 8380_SanchoAppearance and 1079_Sancho_BerserkAppearance. Might not work for 10310_Donquixote_DarkSanchoAppearance.
function sanchoshield(target, active) end

--- @param target TargetMulti
--- @param buffKeyword string -- What appears on the unit when they retreat (e.g., Overwatch Assignment).
--- Queues the target to retreat at turn end.
function retreat(target, buffKeyword) end

--- @param type "bgm" | "sfx" | "voice" | "announcer"
--- @param toPlay? string
--- Play a given SFX, BGM, Voice line, or Announcer line.
function sound(type, toPlay) end

--- @param target TargetMulti
--- @param amount integer
--- Triggers Sinking Deluge.
function surge(target, amount) end

--- @param target TargetMulti
--- @param ability string
--- @param stack integer
--- @param turn integer
--- @param activeRound 0 | 1 | 2
--- Adds a unique system ability to the target.
function addability(target, ability, stack, turn, activeRound) end

--- @param target TargetMulti
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

--- @param ... integer | "all" | -1  -- The coins to make unbreakable, -1 to target the coin this script is on (starts at 0). 
--- Makes the specified coins unbreakable.
function makeunbreakable(...) end

--- @param var1 integer
--- @param add? "add" -- Add to the value instead of setting.
--- Sets the stage extra slot to a specific value.
function stageextraslot(var1, add) end

--- @param mode "add" | "sub" | "spend"
--- @param value integer
--- @param target? TargetMulti
--- Modifies bloodfeast resource: add/sub/spend value. "spend" requires a target to consume for.
function bloodfeast(mode, value, target) end

--- @param value integer -- Percent chance to add. (15 → +15% chance)
--- Add to the chance of a critical hit.
function critchance(value) end

--- @param defender "Defender" | TargetMulti
--- @param defended "Defended" | TargetMulti
--- @param skillId integer -- Skill to defend with. Must be in the defender's defense skill list.
--- Defends a unit based on the parameters.\
--- [NOTE] The defender Skill must have the Skill ability "SupportiveDefense", and the unit defending must have a buff with the ability "SupportProtect" (Mao Faust assist defense).
function assistdefense(defender, defended, skillId) end

--- @param value ModularBoolean
--- Disables/Enables panic for the target.
function ignorepanic(value) end

--- @param value ModularBoolean
--- Disables/Enables stagger for the target.
function ignorebreak(value) end

--- @param motionType "Default" | "Dead" | "Evade" | "Guard" | "Damaged" | "Move" | "Attack" | "S1" | "S2" | "S3" | "S4" | "S5" | "S6" | "S7" | "S8" | "S9" | "S10" | "Parrying" | "Idle" | "Parrying_Range" | "Special1" | "Special2" | "Special3" | "S11" | "S12" | "S13" | "S14" | "S15" | "S16" | "S17" | "S18" | "S19" | "S20" | "S21" | "Empty"
--- @param motionIndex integer
--- Changes a skill's motion/animation type and index.\
--- Example: changemotion("S1", 2) will set the motion to the skill 1 motion's third coin.
function changemotion(motionType, motionIndex) end

--- @param motionType Sin | Virtues
--- Changes the Sin Affinity of a skill on the usage of said Skill.\
--- This works best on the "OnStartBehaviour" timing, but may be usable in other timings as well.
function changeaffinity(motionType) end

--- @param target TargetMulti
--- @param atkType AttackTypeCaps
--- @param newValue integer -- 0 ≤ x ≤ 200 (game uses newValue/100)
--- @param add? any -- if provided, add newValue to existing resistance instead of overriding.
--- Override an attack resistance value for the selected targets.
function ovwatkres(target, atkType, newValue, add) end

--- @param target TargetMulti
--- @param sinType Sin
--- @param newValue integer -- 0 ≤ x ≤ 200 (game uses newValue/100)
--- @param add? any -- if provided, add newValue to existing resistance instead of overriding.
--- Override a sin resistance value for the selected targets.
function ovwsinres(target, sinType, newValue, add) end

--- @param target TargetMulti
--- Refreshes the target's speed. Useful after applying MaxSpeedAdder/MinSpeedAdder system abilities.
function refreshspeed(target) end

--- @param target TargetMulti
--- @param keyword string -- The buff keyword to destroy.
--- @param destroyRound 0 | 1 | 2 -- This Turn | Next Turn | Both
--- Destroy buff(s) on targets.
function destroybuff(target, keyword, destroyRound) end

--- @param target TargetMulti
--- @param mode BuffCategory
--- @param destroyRound 0 | 1 | 2 -- This Turn | Next Turn | Both
--- @param amount integer -- Number of buffs to pick randomly and destroy (>= 0)
--- @param includeCantBeDespelled? any -- If provided, include buffs with canBeDespelled = false
--- Destroy buff(s) on targets.
function destroybuff(target, mode, destroyRound, amount, includeCantBeDespelled) end

--- @param target TargetMulti
--- @param breakIndex integer -- Index of the stagger bar (starts at 0). Use -1 to deactivate all stagger bars.
--- @param sort boolean -- If true, sort the active stagger bars list in descending order before deactivation.
--- @param reverseIndex? any -- Optional. If provided, the active stagger bars list is reversed before indexing (index still starts at 0).
--- Deactivates one or all active stagger bars on selected targets.
function deactivebreak(target, breakIndex, sort, reverseIndex) end

--- @param MultiTarget TargetMulti
--- @param buffCategory BuffCategory
--- @param stack integer
--- @param turn integer
--- @param activeRound 0 | 1 | 2 -- This Turn | Next Turn | Both
--- @param StackTurnAddRespectively boolean -- If true, add stack potency and turn count. If false, with buffs that don't have Count, add (stack + turn) potency to that buff. With buffs that have Count, inflict random X potency and Y count for that buff (X + Y = stack + turn)
--- @param amount integer
--- Inflicts potency and count based on buff category. Accept negative values.
function bufcategory(MultiTarget, buffCategory, stack, turn, activeRound, StackTurnAddRespectively, amount) end

--- @param MultiTarget TargetMulti
--- @param newValue integer
--- Sets the unit's defense correction.
function defcorrection(MultiTarget, newValue) end

--#endregion

--#region Buff Exclusive

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

--#endregion

--#region Lua Exclusive

--- @param target TargetSingle
--- @param dataId string
--- @param value any
--- Sets encounter-persistent data to the target that can be retrieved using getldata().
--- @see getldata
function setldata(target, dataId, value) end

--- @param target TargetSingle
--- @param dataId string
--- @return any
--- Gets encounter-persistent data from the target that was set using setldata().
--- @see setldata
function getldata(target, dataId) end

--- Clears the values of a Modular script.
function clearvalues() end

--- Clears the adders of a Modular script.
function resetadders() end

--- @param selector string
--- @return string[] -- A table of inst ids, e.g. {"inst12","inst34"}
--- Takes a multi-target selector string and returns a table of the selected targets (i.e. ["inst12", "inst34"]).\
--- Inst selectors are recognized by Modular, meaning you can pass them into consequence/value acquirers that accept target selectors.
--- @nodiscard
function selecttargets(selector) return {} end

--- @param directory string -- Path of the directory (i.e. "Lethe")
--- @return string[]
--- Lists all files in a directory.\
--- Files outside of the Plugins folder cannot be accessed.
--- @nodiscard
function listfiles(directory) return {} end

--- @param directory string -- Path of the directory (i.e. "Lethe")
--- @return string[]
--- Lists all folders in a directory.\
--- This function does not list files.\
--- Files outside of the Plugins folder cannot be accessed.\
--- @see listfiles
--- @nodiscard
function listdirectories(directory) return {} end

--- @param target string
--- @return string[]
--- Returns all the buffs' keyword that the target has.
--- @nodiscard
function listbuffs(target) return {} end

--- @param key string
--- @param value any
--- Sets a global value that can be retrieved using getgdata().\
--- This value persists until the client is closed.\
--- @see getgdata
function setgdata(key, value) end;

--- @param key string
--- @return any
--- Gets a global value that was set using setgdata().\
--- This value persists until the client is closed.\
--- @see setgdata
--- @nodiscard
function getgdata(key) return {} end;

--- Clears all global data.\
--- @see setgdata
--- @see getgdata
function clearallgdata() end;

--- @param directory string -- Path of the file (i.e. "Lethe/modularcodesecrets.txt")
--- @return string
--- Reads the contents of a file.\
--- Files outside of the Plugins folder cannot be accessed.
--- @nodiscard
function readfile(directory) return "" end

--- @return table
--- @param string string
--- Turn a string of json into a lua table.
--- @nodiscard
function jsontolua(string) return {} end

--#endregion
