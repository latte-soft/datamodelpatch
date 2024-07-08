local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {};
    setmetatable(v1, v0);
    return v1;
end;
local function _(v2)
    return v2:find("rbxassetid://");
end;
v0.addPlay = function(v4, v5, v6, v7)
    if v5:find("rbxassetid://") then
        v5 = v5:sub(14);
        if v4[v5] == nil then
            v4[v5] = {
                playtime = v6, 
                loopcount = v7
            };
            return ;
        else
            local v8 = v4[v5];
            v8.playtime = v8.playtime + v6;
            v8 = v4[v5];
            v8.loopcount = v8.loopcount + v7;
            return ;
        end;
    else
        return ;
    end;
end;
return v0;
