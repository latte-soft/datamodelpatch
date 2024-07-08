local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local v7 = require(l_Modules_0.LuaApp.Components.PrimaryStatWidget);
local v8 = require(l_Modules_0.LuaApp.Components.GameDetails.GameRatings);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v11 = v2.PureComponent:extend("GamePlaysAndRatings");
v11.getLayoutInfo = function(v12, v13, v14, v15, v16, v17)
    local l_appTheme_0 = v12.props.appTheme;
    local l_containerWidth_0 = v12.props.containerWidth;
    local v20 = nil;
    local v21 = nil;
    if not v17 then
        v20 = v7.GetMinimumWidth(v13, v14, l_appTheme_0.GameDetails.Text.BoldFont);
        v21 = v7.GetMinimumWidth(v15, v16, l_appTheme_0.GameDetails.Text.BoldFont);
    else
        v20 = v7.GetMinimumWidthRethemed(v13, v14, v17);
        v21 = v7.GetMinimumWidthRethemed(v15, v16, v17);
    end;
    if l_containerWidth_0 / 2 < math.max(v20, v21) * 2 then
        return {
            isOneRow = false, 
            subSectionWidth = l_containerWidth_0, 
            widgetWidth = l_containerWidth_0 / 2
        };
    else
        return {
            isOneRow = true, 
            subSectionWidth = l_containerWidth_0 / 2, 
            widgetWidth = l_containerWidth_0 / 4
        };
    end;
end;
v11.render = function(v22)
    return l_withStyle_0(function(v23)
        local l_appTheme_1 = v22.props.appTheme;
        local l_withNewThemeProvider_0 = v22.props.withNewThemeProvider;
        local l_showGlobalCounters_0 = v22.props.showGlobalCounters;
        local l_containerWidth_1 = v22.props.containerWidth;
        local l_rowPadding_0 = v22.props.rowPadding;
        local l_playing_0 = v22.props.playing;
        local l_visits_0 = v22.props.visits;
        local l_universeId_0 = v22.props.universeId;
        local l_LayoutOrder_0 = v22.props.LayoutOrder;
        local l_localization_0 = v22.props.localization;
        local l_hideVisits_0 = v22.props.hideVisits;
        local v35 = l_abbreviateCount_0(l_playing_0, l_localization_0:GetLocale());
        local v36 = string.upper(l_localization_0:Format("Feature.GameDetails.Label.Playing"));
        local v37 = l_abbreviateCount_0(l_visits_0, l_localization_0:GetLocale());
        local v38 = string.upper(l_localization_0:Format("Feature.GameDetails.Label.Visits"));
        local v39 = v22:getLayoutInfo(v35, v36, v37, v38, l_withNewThemeProvider_0 and v23);
        local l_isOneRow_0 = v39.isOneRow;
        local l_subSectionWidth_0 = v39.subSectionWidth;
        local l_widgetWidth_0 = v39.widgetWidth;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_containerWidth_1, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = not not l_isOneRow_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, if not l_isOneRow_0 then l_rowPadding_0 else 0)
            }), 
            Ratings = v2.createElement(v8, {
                LayoutOrder = not l_isOneRow_0 and 2 or 1, 
                universeId = l_universeId_0, 
                width = l_subSectionWidth_0, 
                withNewThemeProvider = l_withNewThemeProvider_0, 
                showGlobalCounters = l_showGlobalCounters_0
            }), 
            PlaysAndVisitsSection = (not l_hideVisits_0 and l_showGlobalCounters_0) and v2.createElement("Frame", {
                Size = UDim2.new(0, l_subSectionWidth_0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = not l_isOneRow_0 and 1 or 2, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlaySection = v2.createElement(v7, {
                    icon = "LuaApp/icons/GameDetails/playing_large", 
                    number = v35, 
                    label = v36, 
                    font = l_appTheme_1.GameDetails.Text.BoldFont, 
                    color = l_appTheme_1.GameDetails.Text.Color.Main, 
                    withNewThemeProvider = l_withNewThemeProvider_0, 
                    width = l_widgetWidth_0, 
                    LayoutOrder = 1
                }), 
                VisitsSection = v2.createElement(v7, {
                    icon = "LuaApp/icons/GameDetails/sessions_large", 
                    number = v37, 
                    label = v38, 
                    font = l_appTheme_1.GameDetails.Text.BoldFont, 
                    color = l_appTheme_1.GameDetails.Text.Color.Main, 
                    withNewThemeProvider = l_withNewThemeProvider_0, 
                    width = l_widgetWidth_0, 
                    LayoutOrder = 2
                })
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5
})((v3.connect(function(v43, v44)
    local v45 = v43.GameDetails[v44.universeId];
    local v46 = v43.Games[v44.universeId];
    return {
        playing = (not not v45 and v45.playing or v46 and v46.playerCount) or 0, 
        visits = not not v45 and v45.visits or 0
    };
end)((v10(v11))))));
