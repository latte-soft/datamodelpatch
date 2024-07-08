local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.RoactNavigation);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local l_withNavigationFocus_0 = v4.withNavigationFocus;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v10 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustAccessoryView_DEPRECATED);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local _ = function(_)
    return v3.createElement(v11.Container, {
        titleText = "Adjustment", 
        transparentBackground = true, 
        leftItem = v11.BackButton
    });
end;
local v16 = l_withNavigationFocus_0((v7(function(_)
    local l_Theme_0 = l_useStyle_0().Theme;
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        TopBar = v3.createElement(v11.Container, {
            titleText = "Adjustment", 
            transparentBackground = true, 
            leftItem = v11.BackButton
        }), 
        PeekView = v3.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, 48), 
            mountAsFullView = false, 
            showDraggerInClosedState = true, 
            thumbstickScrollEnabled = true, 
            backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            peekHeaderClose = false, 
            isScrollingEnabled = true, 
            peekViewState = l_PeekViewState_0.SuperBrief
        }, {
            Content = v3.createElement(v10)
        })
    });
end)));
return v3.forwardRef(function(v17, v18)
    return v3.createElement(v16, v2.Dictionary.join(v17, {
        defaultChildRef = v18
    }));
end);
