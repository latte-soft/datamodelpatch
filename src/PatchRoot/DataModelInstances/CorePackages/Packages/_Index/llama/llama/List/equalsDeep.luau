local v0 = require(script.Parent.Parent.equalObjects);
local function v1(v2, v3)
    if type(v2) == "table" and type(v3) == "table" then
        for v4 = 1, #v2 do
            if not v1(v2[v4], v3[v4]) then
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
        local v5 = select("#", ...);
        for v6 = 1, v5 do
            local v7 = select(v6, ...);
            for v8 = 1, v5 do
                if not (not (v8 ~= v6) or v1(v7, (select(v8, ...)))) then
                    return false;
                end;
            end;
        end;
        return true;
    else
        return true;
    end;
end;
