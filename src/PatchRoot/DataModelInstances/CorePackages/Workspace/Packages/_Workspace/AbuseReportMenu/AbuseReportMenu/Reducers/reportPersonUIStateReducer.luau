local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_PlayerMenuActions_0 = v1.PlayerMenuActions;
return function(v4, v5)
    local v6 = table.clone(v4);
    local l_type_0 = v5.type;
    if l_type_0 == l_PlayerMenuActions_0.UpdateAbuseReason then
        v6.abuseReason = v5.abuseReason;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateComment then
        v6.comment = v5.comment;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateMethodOfAbuse then
        v6.playerObjects = {};
        v6.abuseReason = nil;
        v6.methodOfAbuse = v5.methodOfAbuse;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateAbuser then
        v6.allegedAbuserId = v5.abuseId;
        v6.allegedAbuser = v5.abuser;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdatePlayerNameMap then
        v6.playerObjects = v5.playerObjects;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.SetVoiceEnabled then
        v6.isVoiceEnabled = v5.enabled;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.SetMenuOpenTimestamp then
        v6.menuOpenedUnixTimestampMilliseconds = v5.timestamp;
        return v6;
    elseif l_type_0 == l_PlayerMenuActions_0.ClearState then
        return (table.clone(v1.InitPersonUIState));
    elseif l_type_0 == l_PlayerMenuActions_0.SetShowModalSelector then
        v6.isModalSelectorShown = v5.isShown;
        v6.modalSelectorCellData = v5.cellData;
        return v6;
    else
        if l_type_0 == l_PlayerMenuActions_0.SetPreselectedPlayer then
            v6.preselectedPlayer = v5.player;
        end;
        return v6;
    end;
end;
