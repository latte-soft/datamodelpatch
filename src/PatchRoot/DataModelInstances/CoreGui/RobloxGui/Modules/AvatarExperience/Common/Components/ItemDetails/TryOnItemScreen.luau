local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetails);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(v8)
    local v9 = l_useDispatch_0();
    v3.useEffect(function()
        return function()
            v9(v5());
        end;
    end, {});
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        SceneInteractionFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 1
        }, v2.createElement(v7)), 
        ItemDetails = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, v2.createElement(v6, v8))
    });
end);
