local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ResponsiveLayoutProvider_0 = v3.Core.Layout.Responsive.ResponsiveLayoutProvider;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v9 = require(l_Modules_0.LuaApp.Components.GridHome.GridSettings);
local v10 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v13 = require(l_Modules_0.Personalization.Games.GamesOmniFeed);
local v14 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v15 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v16 = require(l_Modules_0.Personalization.Games.ChartsPageExperimentation);
local v17 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppDiscoverPageGrid);
local l_GetFFlagDeprecateGridSettings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDeprecateGridSettings;
local v19 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v20 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename);
local v21 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRenameIXP);
local function v40(_)
    local v24 = v12(function(v23)
        if not v17() then
            return nil;
        else
            return v23.useGridPageLayout();
        end;
    end);
    local v26 = v12(function(v25)
        return v25.getGamesPageCreationCenterTitle();
    end);
    local v27 = nil;
    if not (not v20 or v21 and not v16.getIsChartsPageRenameEnabled()) then
        v27 = true;
    end;
    local v28 = v8({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = if not v20 then nil else "CommonUI.Features.Label.Charts"
    });
    local l_creationCenter_0 = v28.creationCenter;
    local v30 = v15(l_AppNotificationService_0);
    local v32 = l_useSelector_0(function(v31)
        return v31.Startup.GamesPageDataStatus;
    end);
    local v34 = l_useSelector_0(function(v33)
        return v33.ScreenSize.X;
    end);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    v2.useEffect(function()
        if v32 == v14.Done then
            v30:ActionEnabled(Enum.AppShellActionType.GamePageLoaded);
        end;
    end, {
        v32, 
        v30
    });
    local v38 = nil;
    if v20 then
        if not v26 then
            if v27 then
                v38 = v28.chartsTitle;
            end;
        else
            v38 = l_creationCenter_0;
        end;
    end;
    local v39 = {
        TopBar = if not v19 then v2.createElement(v10, {
            titleText = if not v20 then v26 and l_creationCenter_0 or nil else v38, 
            useGridPageLayout = v24
        }) else nil, 
        Content = if not v19 then v2.createElement(v11.PageContent, {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0
        }, {
            GamesOmniFeed = v2.createElement(v13)
        }) else nil, 
        GamesOmniFeed = if not v19 then nil else v2.createElement(v13)
    };
    if not ((l_GetFFlagDeprecateGridSettings_0() or not v17()) or not v24) then
        v39 = {
            GridProvider = v2.createElement(l_ResponsiveLayoutProvider_0, {
                config = v9.Config, 
                width = v34
            }, v39)
        };
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0
    }, v39);
end;
return function(v41)
    return v2.createElement(v40, v41);
end;
