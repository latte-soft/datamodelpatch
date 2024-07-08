local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = {};
local _ = require(script.Parent.views.Components.types);
local _ = require(script.Parent.types);
v2.printElement = function(v5, v6)
    v6 = v6 or false;
    local v7 = " ";
    if #v5.children > 0 then
        v7 = not v5.isCollapsed and "\226\150\190" or "\226\150\184";
    end;
    local v8 = "";
    if v5.key ~= nil and v5.key ~= "" then
        v8 = string.format(" key=\"%s\"", (tostring(v5.key)));
    end;
    local v9 = nil;
    if v5.hocDisplayNames ~= nil then
        v9 = table.clone(v5.hocDisplayNames);
    end;
    local v10 = v9 == nil and "" or string.format(" [%s]", table.concat(v9, "]["));
    local v11 = "";
    if v6 then
        v11 = string.format(" (%s)", if not v5.isCollapsed then tostring(v5.weight) else "1");
    end;
    return string.format("%s%s <%s%s>%s%s", ("  "):rep(v5.depth + 1), v7, v5.displayName or "null", v8, v10, v11);
end;
v2.printOwnersList = function(v12, v13)
    v13 = v13 or false;
    return table.concat(l_Array_0.map(v12, function(v14)
        return v2.printElement(v14, v13);
    end), "\n");
end;
v2.printStore = function(v15, v16)
    v16 = v16 or false;
    local v17 = {};
    local v18 = 0;
    l_Array_0.forEach(v15:getRoots(), function(v19)
        local l_weight_0 = v15:getElementByID(v19).weight;
        table.insert(v17, "[root]" .. (not v16 and "" or string.format(" (%d)", l_weight_0)));
        for v21 = v18, (v18 + l_weight_0) - 1 do
            local v22 = v15:getElementAtIndex(v21);
            if v22 == nil then
                error(string.format("Could not find element at index %d", v21));
            end;
            table.insert(v17, v2.printElement(v22, v16));
        end;
        v18 = v18 + l_weight_0;
    end);
    if v18 ~= v15:getNumElements() then
        error(("Inconsistent Store state. Individual root weights (%s) do not match total weight (%s)"):format(tostring(v18), (tostring(v15:getNumElements()))));
    end;
    v15:assertExpectedRootMapSizes();
    return table.concat(v17, "\n");
end;
v2.sanitizeForParse = function(v23)
    if ((typeof(v23) == "string" and #v23 >= 2) and string.sub(v23, 1, 1) == "'") and string.sub(v23, #v23) == "'" then
        return "\"" .. string.sub(v23, 1, #v23 - 2) .. "\"";
    else
        return v23;
    end;
end;
v2.smartParse = function(v24)
    if v24 == "Infinity" then
        return math.huge;
    elseif v24 == "NaN" then
        return 0;
    elseif v24 == "undefined" then
        return nil;
    else
        return l_HttpService_0:JSONDecode(v2.sanitizeForParse(v24));
    end;
end;
v2.smartStringify = function(v25)
    if not (typeof(v25) == "number") and v25 == nil then
        return "undefined";
    else
        return l_HttpService_0:JSONEncode(v25);
    end;
end;
return v2;
