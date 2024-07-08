local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_LuaApp_0.Components.Generic.GridView);
return function(v5, v6)
    local l_windowAbsoluteSize_0 = v6.windowAbsoluteSize;
    local v8 = v3.mount(v3.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        ScrollingFrameWithGridView = v3.createElement("ScrollingFrame", {
            Size = UDim2.new(0, l_windowAbsoluteSize_0.X, 0, l_windowAbsoluteSize_0.Y), 
            CanvasSize = UDim2.new(0, l_windowAbsoluteSize_0.X, 0, 10 * l_windowAbsoluteSize_0.Y), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0
        }, {
            GridView = v3.createElement(v4, v6)
        })
    }), l_CoreGui_0, "TestRoot");
    local l_status_0, l_result_0 = pcall(function()
        v5("game.CoreGui.TestRoot.ScrollingFrameWithGridView");
    end);
    v3.unmount(v8);
    if not l_status_0 then
        error(l_result_0);
    end;
end;
