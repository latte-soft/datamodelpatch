local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v4)
    local v5 = l_useDesignTokens_0();
    local v6, v7 = v1.useBinding(Vector2.new(0, 0));
    local v8 = if not not v4.rigidSlot and v4.flexSlot then v4.margin or v5.Global.Space_200 else 0;
    local v9 = table.clone(v4);
    v9.flexSlot = nil;
    v9.rigidSlot = nil;
    v9.margin = nil;
    v9.padding = nil;
    return v1.createElement("Frame", v2.join({
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v9), {
        Padding = if not v4.padding then nil else v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v4.padding.top or 0), 
            PaddingRight = UDim.new(0, v4.padding.right or 0), 
            PaddingBottom = UDim.new(0, v4.padding.bottom or 0), 
            PaddingLeft = UDim.new(0, v4.padding.left or 0)
        }), 
        Flex = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v6:map(function(v10)
                return UDim2.new(1, -(v10.X + v8), 1, 0);
            end)
        }, v4.flexSlot), 
        Rigid = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            [v1.Change.AbsoluteSize] = function(v11)
                v7(v11.AbsoluteSize);
            end
        }, v4.rigidSlot)
    });
end;
