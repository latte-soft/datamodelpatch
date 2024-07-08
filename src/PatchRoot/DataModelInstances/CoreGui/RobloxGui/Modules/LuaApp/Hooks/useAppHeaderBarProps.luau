local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local _ = v3.Hooks.useNavigation;
local _ = v3.Hooks.usePrevious;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_CorePackages_0.RoactNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation).getCurrentRouteState;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local _ = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local _ = require(l_Modules_0.LuaApp.AppPageProperties);
local v17 = require(l_Modules_0.LuaApp.Enum.HeaderBarDisplayOptions);
local v18 = require(l_Modules_0.LuaApp.Constants);
local v19 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v20 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v21 = require(l_Modules_0.LuaApp.Components.GridHome.Header.UserInfo);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v23 = require(l_Modules_0.Personalization.Games.ChartsPageExperimentation);
local v24 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppDiscoverPageGrid);
local v25 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename);
local v26 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRenameIXP);
local function _(v27)
    return function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v27, 1, 0)
        });
    end;
end;
local function v30(v29)
    return v29.ScreenSize.X < v20.COMPACT_WIDTH_BREAKPOINT;
end;
local function v32(v31)
    return v31.SearchesTypes;
end;
local function v34(v33)
    return v33.SearchesParameters;
end;
return function(v35)
    local l_headerBarDisplayOption_0 = v35.headerBarDisplayOption;
    local l_routeName_0 = v35.routeName;
    local v38 = l_useSelector_0(v30);
    local v39 = l_useSelector_0(v34);
    local v40 = l_useSelector_0(v32);
    local v42 = l_useAppPolicy_0(function(v41)
        return v41.useGridPageLayout();
    end);
    local v44 = l_useAppPolicy_0(function(v43)
        return v43.getGamesPageCreationCenterTitle();
    end);
    local v45 = l_useLocalization_0({
        title = v35.titleLocalizationKey, 
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = if not v25 then nil else "CommonUI.Features.Label.Charts"
    });
    return v2.useMemo(function()
        if not l_headerBarDisplayOption_0 or l_headerBarDisplayOption_0 == v17.HideAll then
            return {};
        else
            local l_title_0 = v45.title;
            local l_BackButton_0 = v19.BackButton;
            local v48 = {
                v19.BuyRobuxButton, 
                v19.NotificationsButton
            };
            local v49 = nil;
            local v50 = nil;
            local l_v42_0 = v42;
            if l_v42_0 then
                l_v42_0 = true;
                if l_routeName_0 ~= l_AppPage_0.Home then
                    l_v42_0 = v24() and l_routeName_0 == l_AppPage_0.Games;
                end;
            end;
            if not ((l_routeName_0 ~= l_AppPage_0.Home and l_routeName_0 ~= l_AppPage_0.Games) and l_routeName_0 ~= l_AppPage_0.GamesList) or l_routeName_0 == l_AppPage_0.SearchPage then
                v48 = {
                    v19.SearchButton, 
                    v19.BuyRobuxButton, 
                    v19.NotificationsButton
                };
                if not (not l_default_0.isEnabled() or not l_default_0:getShowAddFriendsOnHomePageUtilityTray()) and l_routeName_0 == l_AppPage_0.Home then
                    table.insert(v48, 2, v19.AddFriendsPageButton);
                end;
            end;
            if l_v42_0 then
                local v52 = {};
                local l_v21_0 = v21;
                local v54 = 0;
                local l_v54_0 = v54 --[[ copy: 9 -> 12 ]];
                local function v56()
                    return v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_v54_0, 1, 0)
                    });
                end;
                v54 = v19.SearchButton;
                local l_BuyRobuxButton_0 = v19.BuyRobuxButton;
                local l_NotificationsButton_0 = v19.NotificationsButton;
                setlist { ['R006[1 to 5]'] = 'R007 to R011' };
                v48 = v52;
                if not (not l_default_0.isEnabled() or not l_default_0:getShowAddFriendsOnHomePageUtilityTray()) and l_routeName_0 == l_AppPage_0.Home then
                    table.insert(v48, 4, v19.AddFriendsPageButton);
                end;
            end;
            if not v25 then
                if v44 and (not (l_routeName_0 ~= l_AppPage_0.Games and l_routeName_0 ~= l_AppPage_0.GamesList) or l_routeName_0 == l_AppPage_0.SearchPage and v49 == v18.SearchTypes.Games) then
                    l_title_0 = v45.creationCenter;
                end;
            elseif not (l_routeName_0 ~= l_AppPage_0.Games) or l_routeName_0 == l_AppPage_0.SearchPage and v49 == v18.SearchTypes.Games then
                if not v44 then
                    if not (v26 and not v23.getIsChartsPageRenameEnabled()) then
                        l_title_0 = v45.chartsTitle;
                    end;
                else
                    l_title_0 = v45.creationCenter;
                end;
            end;
            if l_routeName_0 == l_AppPage_0.SearchPage then
                local l_searchUuid_0 = v35.searchUuid;
                v50 = v39[l_searchUuid_0];
                v49 = v40[l_searchUuid_0];
            end;
            return {
                titleText = l_title_0, 
                forceCompactMode = v38, 
                leftItem = l_BackButton_0, 
                centerItem = nil, 
                rightItems = v48, 
                searchType = v49, 
                searchParameters = v50
            };
        end;
    end, {
        v45.title, 
        v45.creationCenter, 
        v38, 
        l_headerBarDisplayOption_0, 
        l_routeName_0, 
        v42, 
        v44, 
        v35.searchUuid, 
        v39, 
        v40
    });
end;
