local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(script.Parent.TwoStepRequiredOverlay);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local _ = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v11 = v2.PureComponent:extend(script.Name);
v11.init = function(v12)
    v12.closePrompt = function()
        v12.props.navigation.goBack();
    end;
    v12.navigateToSecuritySettings = function()
        v12.closePrompt();
        v12.props.navigateToSecuritySettings();
    end;
end;
v11.render = function(v13)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        TwoStepRequiredOverlay = v2.createElement(v6, {
            closePrompt = v13.closePrompt, 
            navigateToSecuritySettings = v13.navigateToSecuritySettings, 
            screenSize = v13.props.screenSize
        })
    });
end;
return (l_withNavigation_0((v8((v7((v3.connect(function(v14)
    return {
        screenSize = v14.ScreenSize
    };
end, function(v15)
    return {
        navigateToSecuritySettings = function()
            v15(v10());
        end
    };
end)(v11))))))));
