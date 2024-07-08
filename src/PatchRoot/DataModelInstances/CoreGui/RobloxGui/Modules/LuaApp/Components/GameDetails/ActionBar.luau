local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.Components.Games.PlayButtonContainer);
local v6 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailMoreButton);
local v7 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsShareButton);
local v8 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsButton);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_ActionBarHeight_0 = v4.GameDetails.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v4.GameDetails.ActionBarGradientHeight;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v13 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v14 = require(l_Modules_0.LuaApp.Flags.GetLuaAppGameDetailsShareButtonEnabledV2);
local v15 = v2.PureComponent:extend("ActionBar");
v15.defaultProps = {
    bottomPadding = 0, 
    showMorePage = true, 
    showShareButton = false
};
v15.init = function(v16)
    v16.state = {
        showPlayWithFriendsButton = true
    };
end;
v15.willUnmount = function(_)
end;
v15.render = function(v18)
    local l_appTheme_0 = v18.props.appTheme;
    local l_ZIndex_0 = v18.props.ZIndex;
    local l_leftPadding_0 = v18.props.leftPadding;
    local l_rightPadding_0 = v18.props.rightPadding;
    local l_bottomPadding_0 = v18.props.bottomPadding;
    local l_containerWidth_0 = v18.props.containerWidth;
    local l_universeId_0 = v18.props.universeId;
    local l_showMorePage_0 = v18.props.showMorePage;
    local l_withNewThemeProvider_0 = v18.props.withNewThemeProvider;
    local v28 = v18.state.showPlayWithFriendsButton and v18.props.shouldShowPlayWithFriendsPolicy;
    local v29 = not not l_showMorePage_0 and l_ActionBarHeight_0 or 0;
    local v30 = not l_showMorePage_0 and 0 or 10;
    local v31 = l_ActionBarHeight_0 + l_bottomPadding_0;
    local v32 = v31 + l_ActionBarGradientHeight_0;
    local v33 = -v29 - v30;
    local v34 = v18.props.shareButtonEnabled and v18.props.shouldShowShareButton;
    if v34 then
        v33 = 2 * v33;
    end;
    if v34 then
        v28 = false;
    end;
    if v28 then
        v33 = 2 * v33;
    end;
    return l_withStyle_0(function(v35)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v32), 
            Position = UDim2.new(0, 0, 1, -v32), 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0
        }, {
            ActionBar = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v31), 
                Position = UDim2.new(0, 0, 1, -v31), 
                BackgroundColor3 = not not l_withNewThemeProvider_0 and v35.Theme.BackgroundDefault.Color or l_appTheme_0.Color.Background, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v30)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_leftPadding_0), 
                    PaddingRight = UDim.new(0, l_rightPadding_0), 
                    PaddingBottom = UDim.new(0, l_bottomPadding_0)
                }), 
                MoreButton = l_showMorePage_0 and v2.createElement(v6, {
                    LayoutOrder = 1, 
                    universeId = l_universeId_0, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_leftPadding_0, 
                    containerWidth = l_containerWidth_0
                }), 
                ShareButton = not not v34 and v2.createElement(v7, {
                    LayoutOrder = 2, 
                    universeId = l_universeId_0, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_leftPadding_0, 
                    containerWidth = l_containerWidth_0, 
                    withNewThemeProvider = l_withNewThemeProvider_0, 
                    context = "ActionBar"
                }) or nil, 
                PlayWithFriendsButton = not not v28 and v2.createElement(v8, {
                    LayoutOrder = 3, 
                    universeId = l_universeId_0, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_leftPadding_0, 
                    containerWidth = l_containerWidth_0, 
                    withNewThemeProvider = l_withNewThemeProvider_0, 
                    context = "ActionBar"
                }) or nil, 
                PlayButtonContainer = v2.createElement(v5, {
                    Size = UDim2.new(1, v33, 1, 0), 
                    LayoutOrder = 4, 
                    Font = l_appTheme_0.GameDetails.Text.Font, 
                    universeId = l_universeId_0, 
                    referralSource = v18.props.referralSource
                })
            }), 
            Gradient = v2.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
                Position = UDim2.new(0, 0, 1, -v31), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
                ImageColor3 = not not l_withNewThemeProvider_0 and v35.Theme.BackgroundDefault.Color or l_appTheme_0.Color.Background
            })
        });
    end);
end;
return (v3.connect(function(v36, _)
    return {
        shareButtonEnabled = v14(v36.LocalUserId)
    };
end)((l_RoactAppPolicy_0.connect(function(v38, _)
    return {
        showMorePage = v38.getGameDetailsMorePage(), 
        shouldShowShareButton = v38.shouldShowGameDetailsShareButton(), 
        shouldShowPlayWithFriendsPolicy = v38.getGameDetailsPlayWithFriends()
    };
end)((v13(v15))))));
