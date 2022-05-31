# UT Bot Damage Scale
 A simple mutator that gives bot's advantages or disadvantages.

# Installing
- Place all the files in your Unreal Tournament Systems folder.

# Changing Bot Values
- Edit the file called **BotDamageScale.ini**


**DamageScale** is only used if **ScaleAllBots** is set to False, otherwise **TeamDamageScale** is used instead.

**TeamDamageScale[x]** is the value of the bots damage scaling, 0.5 will result in that teams damage being half of what it normally is.
**TeamDamageScale[0]** is the Red Teams value.
**TeamDamageScale[1]** is the Blue Teams value.
**TeamDamageScale[2]** is the Green Teams value.
**TeamDamageScale[3]** is the Yellow Teams value.

**PreventSelfDamage** stops all bots from damaging their selves.

**PreventTeamSelfDamage[x]** Enable or Disable bots taking damage on that team(0 is disabled, 1 is enabled)
**PreventTeamSelfDamage[0]** toggles self damage for Red Team Bots.
**PreventTeamSelfDamage[1]** toggles self damage for Blue Team Bots.
**PreventTeamSelfDamage[2]** toggles self damage for Green Team Bots.
**PreventTeamSelfDamage[3]** toggles self damage for Yellow Team Bots.

**DamageTakenScale[x]** Scales damage taken from enemy bots, 0.1 will make the bots only take 10% of the normal damage, 5.00 will make the bots take 5 times the damage.
**DamageTakenScale[0]** Red Team Bots damage taken scale.
**DamageTakenScale[1]** Blue Team Bots damage taken scale.
**DamageTakenScale[2]** Green Team Bots damage taken scale.
**DamageTakenScale[3]** Yellow Team Bots damage taken scale.


Example of ini file.
```
[BotDamageScale.BotDamageScale]
DamageScale=50.000
ScaleAllBots=False
TeamDamageScale[0]=1.00
TeamDamageScale[1]=10.00
TeamDamageScale[2]=1.00
TeamDamageScale[3]=1.00
PreventSelfDamage=False
PreventTeamSelfDamage[0]=0
PreventTeamSelfDamage[1]=1
PreventTeamSelfDamage[2]=0
PreventTeamSelfDamage[3]=0
DamageTakenScale[0]=1.00
DamageTakenScale[1]=0.33
DamageTakenScale[2]=1.00
DamageTakenScale[3]=1.00
```