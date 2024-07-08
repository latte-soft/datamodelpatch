local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v4 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_useUserExperiment_0 = v3.useUserExperiment;
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v8 = require(l_CorePackages_0.Workspace.Packages.SocialCommon);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_default_0 = v8.Experiments.NewChatTabExperimentation.default;
local l_useRouteName_0 = v7.Hooks.useRouteName;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v13 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v15 = require(l_Modules_0.LuaApp.Components.GridHome.Header.UserInfo);
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local function _(v17)
    return function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v17, 1, 0)
        });
    end;
end;
return function(v19)
    local v21 = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else l_useUserExperiment_0({
        v4.OmniSearchResultsPageUXExposureLayer
    }, function(v20)
        return (v20[v4.OmniSearchResultsPageUXExposureLayer] or {}).isSearchTypeAuto;
    end, false);
    local v22 = nil;
    local v23 = nil;
    local v25 = l_useSelector_0(function(v24)
        return v24.ScreenSize;
    end);
    local v26 = if not not l_default_0.isEnabled() and l_default_0:getShowAddFriendsOnHomePageUtilityTray() then if not l_default_0.isEnabled() then nil else l_useRouteName_0() == l_AppPage_0.Home else nil;
    if not v19.useGridPageLayout then
        v22 = {
            v13.SearchButton, 
            v13.BuyRobuxButton, 
            v13.NotificationsButton
        };
        if not ((not l_default_0.isEnabled() or not l_default_0:getShowAddFriendsOnHomePageUtilityTray()) or not v26) then
            table.insert(v22, 2, v13.AddFriendsPageButton);
        end;
    else
        local v27 = {};
        local l_v15_0 = v15;
        local v29 = 0;
        local l_v29_0 = v29 --[[ copy: 10 -> 13 ]];
        local function v31()
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_v29_0, 1, 0)
            });
        end;
        v29 = v13.SearchButton;
        local l_BuyRobuxButton_0 = v13.BuyRobuxButton;
        local l_NotificationsButton_0 = v13.NotificationsButton;
        setlist { ['R007[1 to 5]'] = 'R008 to R012' };
        v22 = v27;
        if not ((not l_default_0.isEnabled() or not l_default_0:getShowAddFriendsOnHomePageUtilityTray()) or not v26) then
            table.insert(v22, 4, v13.AddFriendsPageButton);
        end;
        v23 = v25.X < v14.COMPACT_WIDTH_BREAKPOINT;
    end;
    return v2.createElement(v13.Container, {
        titleText = v19.titleText, 
        ZIndex = 2, 
        forceCompactMode = v23, 
        leftItem = v13.BackButton, 
        rightItems = v22, 
        searchType = if not not l_FFlagOmniSearchAutoTabIXP_0 and v21 then v6.SearchTypes.Auto else nil
    });
end;
