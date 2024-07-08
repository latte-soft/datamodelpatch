local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_BaseMenu_0 = require(l_Parent_0.UIBlox).App.Menu.BaseMenu;
local v5 = require(script.Parent.PlayerContextualMenuHeader);
local v6 = {
    width = UDim.new(1, 0)
};
return function(v7)
    local v8 = v2.join(v6, v7);
    local v10 = l_useDesignTokens_0(function(v9)
        return {
            overlayBackgroundColor3 = v9.Semantic.Color.Common.Overlay.Color3, 
            overlayBackgroundTransparency = v9.Semantic.Color.Common.Overlay.Transparency, 
            backgroundColor = v9.Semantic.Color.Background.Default.Color3, 
            backgroundTransparency = v9.Semantic.Color.Background.Default.Transparency, 
            menuCornerRadius = v9.Semantic.Radius.Medium
        };
    end);
    local v11, v12 = v1.useState(0);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v10.overlayBackgroundColor3, 
        BackgroundTransparency = v10.overlayBackgroundTransparency, 
        ZIndex = -1
    }, {
        PositionFrame = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(v8.width, UDim.new(0, 0)), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = v10.backgroundTransparency, 
            BackgroundColor3 = v10.backgroundColor, 
            ZIndex = 0
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v10.menuCornerRadius)
            }), 
            BaseMenu = v1.createElement(l_BaseMenu_0, {
                topElementRounded = false, 
                buttonProps = v8.buttonProps, 
                width = v8.width, 
                enableTokenOverride = true, 
                renderHeader = v1.useCallback(function()
                    return v1.createElement(v5, v2.join(v8.headerProps, {
                        onHeaderHeightChanged = v12
                    }));
                end, {
                    v8.headerProps
                }), 
                headerHeight = v11
            })
        })
    });
end;
