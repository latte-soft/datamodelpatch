local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_script_FirstAncestor_0.Hooks.useScreenSize);
local v5 = require(l_script_FirstAncestor_0.constants);
return function(v6)
    local v7, v8 = v2.useBinding(Vector2.new(0, 0));
    local v9 = v4();
    local v10 = l_useDesignTokens_0();
    local l_Space_150_0 = v10.Global.Space_150;
    local v12 = false;
    if v9.X < v5.MOBILE_BREAKPOINT then
        v12 = v9.X < v9.Y;
    end;
    return v2.createElement("Frame", {
        Size = v6.size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v6.LayoutOrder
    }, {
        StartSlot = v2.createElement("Frame", {
            Size = v7:map(function(v13)
                if not v12 then
                    return (UDim2.new(0.5, -l_Space_150_0, 1, 0));
                else
                    return (UDim2.new(1, 0, 1, -(v13.Y + v10.Global.Space_300)));
                end;
            end), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v6.startSlot), 
        EndSlot = v2.createElement("Frame", {
            Size = if not v12 then UDim2.new(0.5, -l_Space_150_0, 0, 0) else UDim2.new(1, 0, 0, 0), 
            Position = if not v12 then UDim2.new(0.5, l_Space_150_0, 0, 0) else UDim2.new(0, 0, 1, 0), 
            AnchorPoint = if not v12 then Vector2.new(0, 0) else Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v2.Change.AbsoluteSize] = function(v14)
                v8(v14.AbsoluteSize);
            end
        }, v6.endSlot)
    });
end;
