local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Focusable_0 = v5.Focusable;
local l_withNavigationFocus_0 = v4.withNavigationFocus;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.Refinement.RefinementNavBar);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local function v15(v14)
    return v14.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
return (l_withNavigationFocus_0((v10(function(v16)
    local v17 = v5.createFocusController();
    local v18 = v2.useRef(nil);
    local v19 = v2.useRef(nil);
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = v17, 
        defaultChild = v18
    }, {
        TopBar = v2.createElement(v11.Container, {
            titleText = "Avatar Refinement", 
            NextSelectionDown = v18, 
            transparentBackground = true, 
            hideSiteMessageBanner = l_useSelector_0(v15), 
            leftItem = v11.makeBackButton(function()
                v16.navigation.pop();
            end), 
            [v3.Ref] = v19
        }), 
        RefinementNavBar = v2.createElement(v12, {
            [v3.Ref] = v18, 
            NextSelectionUp = v19
        }), 
        GamepadFocusHandlerForPage = v2.createElement(v13, {
            focusController = v17, 
            captureFocusOnMount = true
        })
    });
end))));
