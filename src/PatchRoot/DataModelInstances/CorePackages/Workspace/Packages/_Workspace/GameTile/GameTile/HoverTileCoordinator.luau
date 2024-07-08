local l_Signal_0 = require(script:FindFirstAncestor("GameTile").Parent.AppCommonLib).Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        changed = l_Signal_0.new(), 
        hoveredKey = nil, 
        waitingForHover = nil
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.requestHover = function(v3, v4)
    if v3.hoveredKey == v4 then
        return ;
    elseif v3.waitingForHover == v4 then
        return ;
    elseif not (v3.hoveredKey ~= nil) or v3.waitingForHover ~= nil then
        v3.hoveredKey = v4;
        v3.waitingForHover = nil;
        v3.changed:fire(v3.hoveredKey);
        return ;
    else
        v3.waitingForHover = v4;
        return ;
    end;
end;
v1.cancelHover = function(v5, v6)
    if v5.hoveredKey == v6 then
        if v5.waitingForHover ~= nil then
            v5.hoveredKey = v5.waitingForHover;
            v5.waitingForHover = nil;
        else
            v5.hoveredKey = nil;
        end;
        v5.changed:fire(v5.hoveredKey);
        return ;
    else
        if v5.waitingForHover == v6 then
            v5.waitingForHover = nil;
        end;
        return ;
    end;
end;
v1.reset = function(v7)
    local l_hoveredKey_0 = v7.hoveredKey;
    v7.waitingForHover = nil;
    v7.hoveredKey = nil;
    if l_hoveredKey_0 ~= nil then
        v7.changed:fire(v7.hoveredKey);
    end;
end;
v1.default = v1.new();
return v1;
