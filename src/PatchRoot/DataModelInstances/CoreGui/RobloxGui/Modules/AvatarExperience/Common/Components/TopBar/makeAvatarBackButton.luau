local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v5 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.makeBackButton);
local v6 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local l_useInitializedValue_0 = require(l_CorePackages_0.UIBlox).Core.Hooks.useInitializedValue;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
return function(v12)
    return function(v13)
        local v14 = l_useInitializedValue_0(function()
            return v5(v12);
        end);
        local v16 = l_useSelector_0(function(v15)
            return v15.AvatarExperience.Common.ItemDetailsExpanded;
        end);
        local v18 = l_useSelector_0(function(v17)
            return v17.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
        end);
        local v19 = v11().current.name == v3.SortAndFilters;
        if not v18 or not v16 and not v19 then
            return v6.createElement(v14, v13);
        else
            return v6.createElement("TextButton", {
                Active = false, 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v8.BACK_BUTTON_SIZE, v8.BACK_BUTTON_SIZE), 
                Text = ""
            });
        end;
    end;
end;
