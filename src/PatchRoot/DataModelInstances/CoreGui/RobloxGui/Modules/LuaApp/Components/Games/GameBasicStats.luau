local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_usePlayerCountText_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).usePlayerCountText;
local v9 = require(l_CorePackages_0.Cryo);
local l_useAbbreviatedNumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useAbbreviatedNumberLocalization;
local v11 = require(l_Modules_0.LuaApp.Components.FitImageTextFrame);
local v12 = l_Images_0["icons/status/games/rating_small"];
local v13 = l_Images_0["icons/status/games/people-playing_small"];
local v14 = l_Images_0["icons/status/games/sessions_large"];
local v15 = {
    [v3.GameBasicStatsLayoutType[v3.GameCardLayoutType.Small]] = {
        Padding = 6, 
        TextSize = 14, 
        IconSize = 10, 
        IconTextPadding = 3
    }, 
    [v3.GameBasicStatsLayoutType[v3.GameCardLayoutType.Medium]] = {
        Padding = 12, 
        TextSize = 14, 
        IconSize = 10, 
        IconTextPadding = 3
    }, 
    [v3.GameBasicStatsLayoutType[v3.GameCardLayoutType.Large]] = {
        Padding = 12, 
        TextSize = 16, 
        IconSize = 12, 
        IconTextPadding = 3
    }, 
    [v3.GameBasicStatsLayoutType.GameDetails] = {
        Padding = 13, 
        TextSize = 22, 
        IconSize = 17, 
        IconTextPadding = 5
    }
};
local v16 = v2.PureComponent:extend("GameBasicStats");
v16.init = function(v17)
    v17.getImageProps = function(v18, v19)
        local l_themeInfo_0 = v17.props.themeInfo;
        local v21 = v15[v17.props.layoutType];
        return not not v17.props.withNewThemeProvider and {
            Size = UDim2.new(0, v21.IconSize, 0, v21.IconSize), 
            Image = v18, 
            ImageColor3 = v19.Theme.TextMuted.Color, 
            ImageTransparency = v19.Theme.TextMuted.Transparency
        } or {
            Size = UDim2.new(0, v21.IconSize, 0, v21.IconSize), 
            Image = v18, 
            ImageColor3 = l_themeInfo_0.Color, 
            ImageTransparency = l_themeInfo_0.Transparency
        };
    end;
    v17.getTextProps = function(v22, v23)
        local l_themeInfo_1 = v17.props.themeInfo;
        local v25 = v15[v17.props.layoutType];
        return not not v17.props.withNewThemeProvider and {
            Text = v22, 
            Font = v23.Font.SubHeader1.Font, 
            TextSize = v25.TextSize, 
            TextColor3 = v23.Theme.TextMuted.Color, 
            TextTransparency = v23.Theme.TextMuted.Transparency
        } or {
            Text = v22, 
            Font = l_themeInfo_1.Font, 
            TextColor3 = l_themeInfo_1.Color, 
            TextTransparency = l_themeInfo_1.Transparency, 
            TextSize = v25.TextSize
        };
    end;
end;
v16.render = function(v26)
    local l_Position_0 = v26.props.Position;
    local l_LayoutOrder_0 = v26.props.LayoutOrder;
    local l_upVotes_0 = v26.props.upVotes;
    local l_downVotes_0 = v26.props.downVotes;
    local l_showGlobalCounters_0 = v26.props.showGlobalCounters;
    local l_visits_0 = v26.props.visits;
    local l_layoutType_0 = v26.props.layoutType;
    assert(l_layoutType_0 ~= nil, "GameBasicStats expects a layoutType props");
    local v34 = v15[l_layoutType_0];
    assert(v34 ~= nil, "GameBasicStats expects a supported layoutType props; was given: " .. l_layoutType_0);
    local l_playerCountText_0 = v26.props.playerCountText;
    local l_visitsText_0 = v26.props.visitsText;
    local v37 = "--";
    if not (l_upVotes_0 ~= nil) or l_upVotes_0 < 0 then
        l_upVotes_0 = 0;
    end;
    if not (l_downVotes_0 ~= nil) or l_downVotes_0 < 0 then
        l_downVotes_0 = 0;
    end;
    local v38 = l_upVotes_0 + l_downVotes_0;
    if v38 > 0 then
        v37 = math.floor((l_upVotes_0 / v38) * 100) .. "%";
    end;
    return l_withStyle_0(function(v39)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v34.TextSize), 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v34.Padding)
            }), 
            VoteInfo = v2.createElement(v11, {
                LayoutOrder = 1, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v12, v39), 
                textProps = v26.getTextProps(v37, v39)
            }), 
            PlayerCountInfo = v2.createElement(v11, {
                LayoutOrder = 2, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v13, v39), 
                textProps = v26.getTextProps(l_playerCountText_0, v39)
            }), 
            VisitsInfo = (l_showGlobalCounters_0 and l_visits_0) and v2.createElement(v11, {
                LayoutOrder = 3, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v14, v39), 
                textProps = v26.getTextProps(l_visitsText_0, v39)
            })
        });
    end);
end;
local l_v16_0 = v16;
return (l_RoactAppPolicy_0.connect(function(v41, _)
    return {
        showGlobalCounters = v41.getShowGlobalCounters()
    };
end)(function(v43)
    return v2.createElement(l_v16_0, v9.Dictionary.join(v43, {
        playerCountText = l_usePlayerCountText_0(v43.playerCount), 
        visitsText = l_useAbbreviatedNumberLocalization_0(v43.visits)
    }));
end));
