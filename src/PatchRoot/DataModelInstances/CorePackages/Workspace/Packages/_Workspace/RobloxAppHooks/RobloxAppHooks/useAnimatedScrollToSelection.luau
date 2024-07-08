local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = {
    dampingRatio = 1, 
    frequency = 3
};
local function _(v4, v5, v6, v7, v8)
    local v9 = if v6 == Enum.ScrollingDirection.X then v4.CanvasPosition.X + (v5.AbsolutePosition.X - v4.AbsolutePosition.X) else v4.CanvasPosition.Y + (v5.AbsolutePosition.Y - v4.AbsolutePosition.Y);
    if v9 < v8 then
        return 0;
    else
        return (math.max(v9 - v7, 0));
    end;
end;
return function(v11, v12, v13, v14)
    local v15 = v12 or 0;
    local v16 = v13 or 0;
    local v17 = v14 or v3;
    local v18, v19 = v2.useAnimatedBinding(0);
    return v1.useMemo(function()
        return v18:map(function(v20)
            if v11 == Enum.ScrollingDirection.X then
                return (Vector2.new(v20, 0));
            else
                return (Vector2.new(0, v20));
            end;
        end);
    end, {
        v11
    }), (v1.useCallback(function(v21, v22, _, v24)
        if not v22 then
            if not (not v24 or not v24:IsDescendantOf(v21)) then
                local l_v11_0 = v11;
                local l_v15_0 = v15;
                local l_v16_0 = v16;
                local v28 = if l_v11_0 == Enum.ScrollingDirection.X then v21.CanvasPosition.X + (v24.AbsolutePosition.X - v21.AbsolutePosition.X) else v21.CanvasPosition.Y + (v24.AbsolutePosition.Y - v21.AbsolutePosition.Y);
                v19(v2.spring(v28 < l_v16_0 and 0 or math.max(v28 - l_v15_0, 0), v17));
            end;
            return ;
        else
            return ;
        end;
    end, {
        v15, 
        v11, 
        v16, 
        v17
    }));
end;
