local v0 = require(script.Parent.Parent.equalObjects);
local function v1(v2, v3)
    if type(v2) == "table" and type(v3) == "table" then
        for v4, v5 in pairs(v2) do
            if not v1(v5, v3[v4]) then
                return false;
            end;
        end;
    elseif v2 ~= v3 then
        return false;
    end;
    return true;
end;
return function(...)
    if not v0(...) then
        local v6 = select("#", ...);
        for v7 = 1, v6 do
            local v8 = select(v7, ...);
            for v9 = 1, v6 do
                if not (not (v9 ~= v7) or v1(v8, (select(v9, ...)))) then
                    return false;
                end;
            end;
        end;
        return true;
    else
        return true;
    end;
end;
