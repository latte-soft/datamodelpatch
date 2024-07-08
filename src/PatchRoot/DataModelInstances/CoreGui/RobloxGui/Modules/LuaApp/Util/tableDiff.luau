local v0 = newproxy(true);
getmetatable(v0).__tostring = function()
    return "<removed>";
end;
local function v1(v2, v3, v4)
    v4 = v4 or 0;
    if v4 == 10 then
        return nil;
    elseif v3 == nil then
        return v0;
    elseif typeof(v3) ~= "table" then
        return v3;
    else
        local v5 = {};
        if typeof(v2) == "table" then
            for v6, v7 in pairs(v2) do
                if v3[v6] ~= v7 then
                    v5[v6] = v1(v7, v3[v6], v4 + 1);
                end;
            end;
        end;
        for v8, v9 in pairs(v3) do
            if not (typeof(v2) == "table") or v2[v8] == nil then
                v5[v8] = v1(nil, v9, v4 + 1);
            end;
        end;
        if next(v5) then
            return v5;
        else
            return nil;
        end;
    end;
end;
return v1;
