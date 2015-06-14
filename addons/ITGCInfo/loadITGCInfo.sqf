// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadITGCInfo.sqf
//	@file Author: Lodac

#include "dialog\ITGCInfo_defines.hpp"


//private ["_display", "_map", "_mission", "_player", "_newsOnline", "_newsOffline", "_ctrlHTML", "_htmlLoaded"];

disableSerialization;

_uid = getPlayerUID player;

createDialog "ITGCInfoD";

_display = (findDisplay ITGCInfo_dialog);

_serverInfoText = _display displayCtrl ITGCInfo_Server_Info;
_serverInfoString = format ["<t color='#A0FFFFFF'>ITGC #%1 Wasteland %2</t>", call A3W_extDB_ServerID, worldName];
_serverInfoText ctrlSetStructuredText parseText _serverInfoString;

_generalInfoText = _display displayCtrl ITGCInfo_General_Info_BG;
_generalInfoString = "Website: <t color='#0091CD'><a href='http://itgcommunity.com'>ITGCommunity.com</a></t> TeamSpeak: ts.ITGCommunity.com";
_generalInfoText ctrlSetStructuredText parseText _generalInfoString;


_rulesOnline = "http://ITGCommunity.com/rules.php";
_rulesOffline = "addons\ITGCInfo\rules.html";
_newsOnline = "http://ITGCommunity.com/news.php";
_newsOffline = "addons\ITGCInfo\news.html";
_statsOnline = "http://ITGCommunity.com/stats.php?uid=" + _uid;
_statsOffline = "addons\ITGCInfo\stats.html";


//Load the correct HTML into the control
_ctrlHTML = _display displayCtrl ITGCInfo_Content_Rules;
_ctrlHTML htmlLoad _rulesOnline;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then 
{
	_ctrlHTML htmlLoad _rulesOffline;
};
_ctrlHTML = _display displayCtrl ITGCInfo_Content_News;
_ctrlHTML htmlLoad _newsOnline;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then 
{
	_ctrlHTML htmlLoad _newsOffline;
};
_ctrlHTML = _display displayCtrl ITGCInfo_Content_Stats;
_ctrlHTML htmlLoad _statsOnline;
_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then 
{
	_ctrlHTML htmlLoad _statsOffline;
};

_control = _display displayCtrl ITGCInfo_Content_A3W;
private ["_teamrules", "_teamicon", "_teamcol"];

switch (playerSide) do {
	case BLUFOR: {
		_teamrules = "STR_WL_YouAreInTeam";
		_teamicon = "client\icons\igui_side_blufor_ca.paa";
		_teamcol = "#0066ff";
	};
	case OPFOR: {
		_teamrules = "STR_WL_YouAreInTeam";
		_teamicon = "client\icons\igui_side_opfor_ca.paa";
		_teamcol = "#ff1111";
	};
	case INDEPENDENT: {
		_teamrules = "STR_WL_YouAreInFFA";
		_teamicon = "client\icons\igui_side_indep_ca.paa";
		_teamcol = "#00ff00";
	};
	case sideEnemy: {
		_teamrules = "STR_WL_YouAreInFFA";
		_teamicon = "client\icons\igui_side_indep_ca.paa";
		_teamcol = "#00ff00";
	};
};

_message = format ["<t shadow=""1"">%1<br/>%2<br/>%3<br/></t>",
	//localize "STR_WL_WelcomeToWasteland",
	localize "STR_WL_MapMoreInfo",
	format [localize _teamrules,
		_teamicon,
		_teamcol,
		localize format ["STR_WL_Gen_Team%1", str playerSide],
		localize format ["STR_WL_Gen_Team%1_2", str playerSide]
	]
];

_control ctrlSetStructuredText (parseText _message);
