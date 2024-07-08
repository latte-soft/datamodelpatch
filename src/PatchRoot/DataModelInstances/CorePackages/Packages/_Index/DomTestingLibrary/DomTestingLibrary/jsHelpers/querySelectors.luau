local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local l_getNodeTestId_0 = require(script.Parent.Parent["get-node-test-id"]).getNodeTestId;
local v2 = {};
local function v9(v3, v4, v5)
    return l_Array_0.some(v4, function(v6)
        if v5 then
            if v5 == "property" then
                local _, l_result_0 = pcall(function()
                    return v3[v6];
                end);
                return l_result_0 ~= nil;
            elseif v5 == "tag" then
                return l_getNodeTestId_0(v3) ~= nil;
            else
                return v3:GetAttribute(v6) ~= nil;
            end;
        else
            return v3.ClassName:find(v6) ~= nil;
        end;
    end);
end;
local function v10(v11, v12, v13, v14)
    local v15 = {};
    l_Array_0.forEach(v11:GetChildren(), function(v16)
        local l_v12_0 = v12;
        local l_v13_0 = v13;
        if l_Array_0.some(l_v12_0, function(v19)
            if l_v13_0 then
                if l_v13_0 == "property" then
                    local _, l_result_1 = pcall(function()
                        return v16[v19];
                    end);
                    return l_result_1 ~= nil;
                elseif l_v13_0 == "tag" then
                    return l_getNodeTestId_0(v16) ~= nil;
                else
                    return v16:GetAttribute(v19) ~= nil;
                end;
            else
                return v16.ClassName:find(v19) ~= nil;
            end;
        end) then
            table.insert(v15, v16);
        end;
        v15 = l_Array_0.concat(v15, v10(v16, v12, v13, v14));
    end);
    return if not v14 then v15 else if v14 == 1 then v15[1] else l_Array_0.slice(v15, 1, v14 + 1);
end;
v2.querySelector = function(v22, v23, v24)
    return (v10(v22, v23, v24, 1));
end;
v2.querySelectorAll = function(v25, v26, v27)
    return (v10(v25, v26, v27));
end;
v2.matches = v9;
return v2;
