local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.StringUtilities.StringReplaceAll);
local function v4()
    local v2 = {};
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 ~= nil then
        if l_LocalPlayer_0.UserId and l_LocalPlayer_0.UserId > 0 then
            v2[tostring(l_LocalPlayer_0.UserId)] = "UserId";
        end;
        if l_LocalPlayer_0.Name and l_LocalPlayer_0.Name ~= "" then
            v2[tostring(l_LocalPlayer_0.Name)] = "UserName";
        end;
    end;
    return v2;
end;
local function v5(v6, v7)
    if not v7 then
        v7 = v4();
    end;
    if type(v6) == "table" then
        local v8 = {};
        for v9, v10 in pairs(v6) do
            v8[v9] = v5(v10, v7);
        end;
        return v8;
    elseif type(v6) ~= "string" then
        for v11, v12 in pairs(v7) do
            if tostring(v6) == v11 then
                return v12;
            end;
        end;
        return v6;
    else
        return v1(v6, v7);
    end;
end;
return v5;
