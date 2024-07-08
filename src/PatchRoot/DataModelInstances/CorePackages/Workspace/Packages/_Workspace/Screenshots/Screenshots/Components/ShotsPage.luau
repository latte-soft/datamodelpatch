local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v6 = require(l_Parent_0.Components.CaptureConfigCTAs);
local v7 = require(l_Parent_0.Analytics.EventNames);
local v8 = require(l_Parent_0.Components.ShotsGallery);
local v9 = require(l_Parent_0.Analytics.useAnalytics);
return function(v10)
    local v11 = v2.useCallback(function()
        v10.closeSettingsMenu();
    end, {});
    local v12 = v9();
    local v13, v14 = v2.useState(0);
    local v16 = l_useSelector_0(function(v15)
        return v15.Screenshots.IsMenuOpen;
    end);
    l_useEffectOnce_0(function()
        v12.fireEvent(v7.CapturesPageOpenedInGameMenu);
    end, v16);
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Visible = v16
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        CaptureConfigCTAs = v2.createElement(v6, {
            closeSettingsMenu = v11, 
            LayoutOrder = 1, 
            onAbsoluteSizeChanged = v2.useCallback(function(v17)
                v14(v17.Y);
            end, {})
        }), 
        ShotsGallery = v2.createElement(v8, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -v13 - 12)
        })
    });
end;
