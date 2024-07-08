local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.TopBar.Constants);
local l_ScreenSideOffset_0 = v3.ScreenSideOffset;
local l_TopBarButtonHeight_0 = v3.TopBarButtonHeight;
local v6 = require(l_CorePackages_0.UIBlox);
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local l_Dark_0 = v6.App.Style.Constants.ThemeName.Dark;
local v9 = require(l_CorePackages_0.Packages.Promise);
local v10 = require(script.Parent.SelfViewTooltipFTUX);
return function(v11)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SelfViewTooltipOnCloseGui";
    l_ScreenGui_0.DisplayOrder = -1;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v13 = v1.mount(v1.createElement(l_AppStyleProvider_0, {
        style = {
            themeName = l_Dark_0
        }
    }, {
        frame = v1.createElement("Frame", {
            Position = UDim2.fromOffset(l_ScreenSideOffset_0, -l_TopBarButtonHeight_0), 
            Size = UDim2.fromOffset(l_TopBarButtonHeight_0, l_TopBarButtonHeight_0), 
            BackgroundTransparency = 0, 
            Visible = false
        }, {
            tooltip = v1.createElement(v10, {
                fallbackText = v11.fallbackText, 
                translationKey = v11.translationKey, 
                tooltipLifetime = v11.tooltipLifetime
            })
        })
    }), l_ScreenGui_0, "SelfViewTooltipOnClose");
    v9.delay(v11.tooltipLifetime + 5):andThen(function()
        pcall(function()
            v1.unmount(v13);
        end);
    end);
end;
