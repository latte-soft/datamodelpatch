local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.RoactNavigation);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withNavigation_0 = v5.withNavigation;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v18 = l_Images_0["icons/actions/reset"];
local v19 = UDim.new(0, 10);
local function v22(v20)
    local l_Theme_0 = l_useStyle_0().Theme;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.new(1, -v13.RightMargin, 0, -9), 
        Size = UDim2.fromOffset(34, 34), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Visible = not v20.lastInputIsGamepad
    }, {
        Button = v2.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            Image = v18, 
            ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            ImageTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            [v2.Event.Activated] = v20.onActivated
        })
    });
end;
local function v25(v23)
    local l_Theme_1 = l_useStyle_0().Theme;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(1, -v13.VerticalList.Width / 2, 0, 0), 
        Size = UDim2.fromOffset(v13.Tile.MoreIconSize, v13.Tile.MoreIconSize), 
        LayoutOrder = 1, 
        Visible = not v23.lastInputIsGamepad, 
        BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = v19
        }), 
        Button = v2.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            Image = v18, 
            ImageColor3 = l_Theme_1.IconEmphasis.Color, 
            ImageTransparency = l_Theme_1.IconEmphasis.Transparency, 
            [v2.Event.Activated] = v23.onActivated
        })
    });
end;
local v26 = v2.PureComponent:extend("ResetButton");
v26.validateProps = v4.strictInterface({
    lastInputIsGamepad = v4.boolean, 
    isDragging = v4.boolean, 
    navigation = v4.table, 
    analytics = v4.table, 
    sendAnalytics = v4.callback
});
v26.defaultProps = {
    lastInputIsGamepad = false, 
    isDragging = false
};
v26.init = function(v27)
    v27.openResetConfirmation = function()
        if not v27.props.isDragging then
            v27.props.sendAnalytics(v27.props.analytics.avatarRefineLayersResetTap);
            v27.props.navigation.navigate(v12.ResetLCSortPrompt);
            return ;
        else
            return ;
        end;
    end;
end;
v26.render = function(v28)
    if not l_IsVRAppBuild_0() then
        return v2.createElement(v22, {
            onActivated = v28.openResetConfirmation, 
            lastInputIsGamepad = v28.props.lastInputIsGamepad
        });
    else
        return v2.createElement(v25, {
            onActivated = v28.openResetConfirmation, 
            lastInputIsGamepad = v28.props.lastInputIsGamepad
        });
    end;
end;
return (v3.connect(nil, function(v29)
    return {
        sendAnalytics = function(v30)
            v29(v16(v30));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v15
})((l_withNavigation_0(v26, nil))))));
