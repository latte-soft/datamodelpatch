local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_Focusable_0 = v4.Focusable;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v9 = require(l_Modules_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local _ = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v12 = require(l_Modules_0.AvatarExperience.Catalog.AttributionConstants);
return (v3.connect(function(v13, v14)
    local v15 = v13[l_GameIconReducer_0.key][v14.creatingUniverseId];
    return {
        thumbnailUrl = if not v15 then nil else v15.url
    };
end)((v9.connect(function(v16)
    return {
        universeId = v16.creatingUniverseId, 
        launchSource = "AttributionItemRow", 
        referralSource = "ItemDetailsPage"
    };
end, function(v17, _)
    return {
        playabilityStatus = v17.playabilityStatus, 
        playButtonState = v17.playButtonState, 
        gameName = v17.gameName, 
        onPlayButtonActivated = v17.onPlayButtonActivated
    };
end)((v2.forwardRef(function(v19, _)
    local v21 = nil;
    local v22 = nil;
    if v19.playabilityStatus then
        local l_playabilityStatus_0 = v19.playabilityStatus.playabilityStatus;
        v21 = v12.ShowPlayableAttributionMapper[l_playabilityStatus_0];
        v22 = v12.ShowTraversalAlertMapper[l_playabilityStatus_0];
    end;
    local v24 = l_useNavigation_0();
    return v21 and v2.createElement(l_Focusable_0[v8], {
        infoName = v19.infoName, 
        infoData = not v19.gameName and "" or v19.gameName, 
        onActivate = function()
            if not v22 then
                v19.onPlayButtonActivated();
                return ;
            else
                v24.navigate(v6.OpenExperienceTraversalPrompt, {
                    onPlayButtonActivated = v19.onPlayButtonActivated, 
                    gameName = v19.gameName, 
                    gameUniverseId = v19.creatingUniverseId, 
                    thumbnailUrl = v19.thumbnailUrl
                });
                return ;
            end;
        end, 
        LayoutOrder = v19.LayoutOrder, 
        ref = v19.attributionRef, 
        NextSelectionUp = v19.NextSelectionUp, 
        NextSelectionDown = v19.NextSelectionDown
    });
end))))));
