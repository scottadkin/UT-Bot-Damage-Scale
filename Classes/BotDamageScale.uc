//=============================================================================
// BotDamageScale.
//=============================================================================
class BotDamageScale expands Mutator config(BotDamageScale);

var() config float DamageScale; 
var() config bool ScaleAllBots;
var() config bool PreventSelfDamage;
var() config float TeamDamageScale[4];
var() config byte PreventTeamSelfDamage[4];
var() config float DamageTakenScale[4];

function PostBeginPlay(){

	Level.Game.RegisterDamageMutator(self);
}

function ModifyPlayer(Pawn Other){

	local byte CurrentTeam;
	
	if(Other.PlayerReplicationInfo != None){
	
		if(Other.PlayerReplicationInfo.bIsABot){
		
			if(!ScaleAllBots){
			
				CurrentTeam = Other.PlayerReplicationInfo.Team;
				
				if(CurrentTeam >= 0 && CurrentTeam <= 3){
					
					Other.DamageScaling = TeamDamageScale[CurrentTeam];
				}
			
			}else{
			
				Other.DamageScaling = DamageScale;		
			}
		}
	}
	
	if ( NextMutator != None){
		NextMutator.ModifyPlayer(Other);
	}
	
}

function bool bPreventSelfDamage(Pawn Victim, Pawn InstigatedBy){

	local byte CurrentTeam;
	
	if(!Victim.PlayerReplicationInfo.bIsABot) return false;
	
	if(Victim.PlayerReplicationInfo.PlayerID == InstigatedBy.PlayerReplicationInfo.PlayerID){
		
		if(PreventSelfDamage){
			
			return true;

		}else{
		
			CurrentTeam = Victim.PlayerReplicationInfo.Team;
			
			if(CurrentTeam >= 0 && CurrentTeam <= 3){
				
				if(PreventTeamSelfDamage[CurrentTeam] == 1){
				
					return true;
				}
			}
		}
	}
	
	return false;

}

function float GetDamageTakenScale(byte PlayerTeam){

	if(PlayerTeam >= 0 && PlayerTeam <= 3){
		return DamageTakenScale[PlayerTeam];
	}

	return 1;
}


function MutatorTakeDamage( out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation, out Vector Momentum, name DamageType){

	local float damageScale;
	
	if(Victim.PlayerReplicationInfo != None && InstigatedBy.PlayerReplicationInfo != None){
		
		if(bPreventSelfDamage(Victim, InstigatedBy)){
			
			ActualDamage = 0;
			Momentum.X = 0;
			Momentum.Y = 0;
			Momentum.Z = 0;
			
		}else{
		
			if(Victim.PlayerReplicationInfo.bIsABot){
			
				damageScale = GetDamageTakenScale(Victim.PlayerReplicationInfo.Team);
				ActualDamage = ActualDamage * damageScale;
			}
		}
			
	}

	if ( NextDamageMutator != None )
		NextDamageMutator.MutatorTakeDamage( ActualDamage, Victim, InstigatedBy, HitLocation, Momentum, DamageType );

}

defaultproperties
{
      damageScale=50.000000
      ScaleAllBots=False
      PreventSelfDamage=False
      TeamDamageScale(0)=1.000000
      TeamDamageScale(1)=10.000000
      TeamDamageScale(2)=1.000000
      TeamDamageScale(3)=1.000000
      PreventTeamSelfDamage(0)=0
      PreventTeamSelfDamage(1)=1
      PreventTeamSelfDamage(2)=0
      PreventTeamSelfDamage(3)=0
      DamageTakenScale(0)=1.000000
      DamageTakenScale(1)=0.330000
      DamageTakenScale(2)=1.000000
      DamageTakenScale(3)=1.000000
}
