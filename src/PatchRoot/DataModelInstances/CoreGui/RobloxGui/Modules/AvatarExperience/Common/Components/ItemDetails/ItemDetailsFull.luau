local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.React);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local v8 = UDim.new(1, 0);
local function v9()
    return nil;
end;
return function(v10)
    local l_renderContent_0 = v10.renderContent;
    local v12 = v10.renderTopBar or v9;
    local v13 = v10.renderBottomBar or v9;
    local v14 = v10.topBarHeight or 0;
    local v15 = v10.bottomBarHeight or 0;
    local v16 = v5.useRef(nil);
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v10.viewSize, 
        Position = v10.viewPosition, 
        restorePreviousChildFocus = true, 
        inputBindings = if not not v16 and v16.current ~= nil then {
            ScrollPeekView = v3.Input.onStep(Enum.KeyCode.Thumbstick2, function(v17, v18)
                local l_Position_0 = v17.Position;
                local l_current_0 = v16.current;
                local v21 = l_current_0.CanvasPosition.Y + (v18 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y) * 1000;
                if v21 <= l_current_0.AbsoluteSize.Y * v8.Scale + v8.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v21);
                end;
            end)
        } else nil
    }, {
        TopBar = v12(), 
        ScrollingContent = v2.createElement("ScrollingFrame", {
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(v14 + v15)), 
            Position = UDim2.new(0, 0, 0, v14), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            [v2.Ref] = v16
        }, {
            Content = l_renderContent_0()
        }), 
        BottomBar = if not v7() then v13() else v13 and v13()
    });
end;
