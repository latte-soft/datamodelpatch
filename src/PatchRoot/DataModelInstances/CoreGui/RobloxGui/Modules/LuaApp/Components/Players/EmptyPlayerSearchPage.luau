local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_EmptyState_0 = v1.App.Indicator.EmptyState;
local l_Images_0 = v1.App.ImageSet.Images;
local l_Colors_0 = v1.App.Style.Colors;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.AppPage);
local l_EventNames_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).Analytics.EventNames;
local l_getFFlagPlayerSearchNewEmptyPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPlayerSearchNewEmptyPageEnabled;
local l_GetFFlagTenFootUiPlayerSearchBackground_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiPlayerSearchBackground;
local v15 = l_Images_0["icons/status/oof_xlarge"];
local v16 = l_Images_0["icons/graphic/findfriends_xlarge"];
return function(v17)
    local v18 = l_useNavigation_0();
    local v19 = if not l_getFFlagPlayerSearchNewEmptyPageEnabled_0() then nil else function()
        v17.fireAnalyticsEvent(l_EventNames_0.NavigateToAddFriendsBtn);
        v18.push(v11.AddFriendsPage);
    end;
    local v20 = l_useLocalization_0({
        landingText = "Feature.AddFriends.Label.SearchForFriendsPrompt", 
        keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort", 
        noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound", 
        findFriendsButton = "Feature.Friends.Action.FindFriends", 
        tryAnotherWayText = "Feature.PlayerSearchResults.Label.NoResultsTryAnotherWay"
    });
    local v21 = l_useStyle_0();
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    if not v17.shouldShowUserSearchLandingPage then
        if not v17.searchWordLengthNotSupported then
            if not v17.newEmptyPageUI or not l_getFFlagPlayerSearchNewEmptyPageEnabled_0() then
                v22 = v20.noResultsText;
                v23 = v15;
            else
                v22 = ("%*\n%*"):format(v20.noResultsText, v20.tryAnotherWayText);
                v23 = v16;
                v24 = l_Colors_0.White;
                v25 = v20.findFriendsButton;
                v27 = l_ButtonType_0.PrimarySystem;
                v26 = "";
                v28 = v19;
            end;
        else
            v22 = v20.keywordTooShortText;
            v23 = v15;
        end;
    else
        v22 = v20.landingText;
        v23 = v16;
        v24 = l_Colors_0.White;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = if not not l_GetFFlagTenFootUiPlayerSearchBackground_0() and v17.backgroundTransparency then v17.backgroundTransparency else v21.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v21.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    }, {
        LandingText = v2.createElement(l_EmptyState_0, {
            text = v22, 
            icon = v23, 
            iconColor = v24, 
            buttonText = v25, 
            buttonType = v27, 
            buttonIcon = v26, 
            onActivated = v28, 
            maxSizeTextLabel = Vector2.new(v17.screenSize.X - 64, v17.screenSize.Y)
        })
    });
end;
