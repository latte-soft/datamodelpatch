local l_HttpService_0 = game:GetService("HttpService");
local v1 = nil;
local v2 = {};
local function v13(v3)
    local v4 = v3:find("(", 1, true);
    local v5 = v3:reverse():find(")", 1, true);
    if v5 ~= nil then
        v5 = (#v3 - v5) + 1;
    end;
    local v6 = {};
    if v4 then
        assert(v5, "invalid syntex, expecting \")\"");
        local v7 = v3:sub(v4 + 1, v5 - 1);
        if #v7 > 0 then
            v6 = l_HttpService_0:JSONDecode("[" .. v7 .. "]");
        end;
        v3 = v3:sub(1, v4 - 1);
    end;
    local v8 = v3:split(".");
    local l_v1_0 = v1;
    for v10 = 1, #v8 do
        local v11 = v8[v10];
        l_v1_0 = l_v1_0:FindFirstChild(v11);
        assert(l_v1_0, "can not find " .. v11);
        if not (not l_v1_0 or not l_v1_0:IsA("ModuleScript")) then
            local v12 = require(l_v1_0);
            assert(typeof(v12) == "function", "target is not a function");
            return v12(unpack(v6));
        end;
    end;
    return nil;
end;
v2.setCommandPath = function(v14)
    v1 = v14;
end;
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("RhodiumService");
end);
if l_status_0 then
    l_result_0.onCommand = v13;
end;
return v2;
