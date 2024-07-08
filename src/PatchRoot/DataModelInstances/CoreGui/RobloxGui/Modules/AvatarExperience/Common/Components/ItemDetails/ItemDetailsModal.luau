local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local function v5()
    return nil;
end;
return function(v6)
    local l_renderContent_0 = v6.renderContent;
    local v8 = v6.renderTopBar or v5;
    local v9 = v6.renderBottomBar or v5;
    local v10 = v6.topBarHeight or 0;
    return v2.createElement(v3, {}, {
        TopBar = v8(), 
        ScrollingContent = v2.createElement("ScrollingFrame", {
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(v10 + (v6.bottomBarHeight or 0))), 
            Position = UDim2.new(0, 0, 0, v10), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Content = l_renderContent_0()
        }), 
        BottomBar = if not v4() then v9() else v9 and v9()
    });
end;
