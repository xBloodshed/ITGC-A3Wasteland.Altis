// Airdrop Reqiest v0.1
// Author CRE4MPIE
// Date 22-01-2015
// Filename:crate.sqf

private ["_playermoney","_price","_confirmMsg"];

_playerMoney = player getVariable ["bmoney", 0];
_price = 25000;
if (_price > _playerMoney) exitWith
			{
				hint format["You don't have enough money in the bank to request this airdrop!"];
				playSound "FD_CP_Not_Clear_F";
			};
			
_confirmMsg = format ["This airdrop will deduct $25,000 from your bank account<br/>"];
_confirmMsg = _confirmMsg + format ["<br/><t font='EtelkaMonospaceProBold'>1</t> x Random Weapon Crate"];
		// Display confirm message
		if ([parseText _confirmMsg, "Confirm", "DROP", true] call BIS_fnc_guiMessage) then
		{	
		
		if (!isNil "vehicleStore_lastPurchaseTime") then
{	// Include vehicle store cooldown timer

	_timeLeft = (["A3W_vehiclePurchaseCooldown", 60] call getPublicVar) - (diag_tickTime - vehicleStore_lastPurchaseTime);

	if (_timeLeft > 0) then
	{
		hint format ["You need to wait %1s before requesting another airdrop!", ceil _timeLeft];
		playSound "FD_CP_Not_Clear_F";
		breakOut "buyVehicles";
	};
};

			player setVariable["bmoney",(player getVariable "bmoney")-_price,true];
			vehicleStore_lastPurchaseTime = diag_tickTime;
					

			
		_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 250];
		_para = createVehicle ["B_Parachute_02_F", _posplr, [], 0, ""];
			_spwnveh = "Box_NATO_AmmoVeh_F" createVehicle _posplr;
			_randomBox = ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"] call BIS_fnc_selectRandom;
			[_spwnveh, _randomBox] call fn_dropbox;
			_spwnveh setDir random 360;
			_spwnveh setPos (_posplr);
			_spwnveh attachTo [_para,[0,0,-1.5]];
			_spwnveh setVariable ["R3F_LOG_disabled",false,true];	
			
		if (["A3W_playerSaving"] call isConfigOn) then
		{
				[] spawn fn_savePlayerData;
		};
			WaitUntil {(((position _spwnveh) select 2) < 100)};
			_smoke1= "SmokeShellRed" createVehicle getPos _spwnveh;
			_smoke1 attachto [_spwnveh,[0,0,-0.5]];
			_flare1= "F_40mm_Red" createVehicle getPos _spwnveh;
			_flare1 attachto [_spwnveh,[0,0,-0.5]];
			WaitUntil {(((position _spwnveh) select 2) < 60)};
			_flare1= "F_40mm_Red" createVehicle getPos _spwnveh;
			_flare1 attachto [_spwnveh,[0,0,-0.5]];
			
			WaitUntil {((((position _spwnveh) select 2) < 1.5) || (isNil "_para"))};
			detach _spwnveh;
		};