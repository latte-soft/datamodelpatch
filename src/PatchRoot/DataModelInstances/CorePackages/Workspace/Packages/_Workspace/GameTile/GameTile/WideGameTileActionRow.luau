local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.WideGameTileViewConfig);
local v2 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
return function(v6)
    return v4.createElement(v2, {
        universeId = v6.universeId, 
        launchExperienceEventContext = v6.launchExperienceEventContext, 
        referralSource = v6.referralSource, 
        launchSource = v6.launchSource, 
        reportExperienceLaunched = v6.reportExperienceLaunched, 
        entry = v6.entry, 
        openGameDetails = v6.openGameDetails, 
        height = v1.getPlayButtonHeight((l_useDesignTokens_0())), 
        horizontalPadding = 0, 
        verticalPadding = 0, 
        fetchDelayInSeconds = v6.fetchDelayInSeconds
    });
end;
