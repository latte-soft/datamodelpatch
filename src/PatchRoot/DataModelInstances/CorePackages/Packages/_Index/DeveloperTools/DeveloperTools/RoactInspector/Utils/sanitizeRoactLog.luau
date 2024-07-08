local v0 = require(script.Parent.Parent.Parent.Parent.Dash);
local l_some_0 = v0.some;
local l_collectArray_0 = v0.collectArray;
local l_forEach_0 = v0.forEach;
local l_endsWith_0 = v0.endsWith;
local l_concat_0 = table.concat;
local v6 = {
    "RoactInspector%.Classes", 
    "Roact%.createReconciler", 
    "Roact%.Component", 
    "Roact%.SingleEventManager", 
    "Roact%.RobloxRenderer", 
    "Libs%.RoactRodux", 
    "Rodux%.Signal", 
    "Rodux%.Store"
};
return function(v7)
    local v8 = v7:split("\n");
    local v9 = 0;
    l_forEach_0(v8, function(v10)
        if not (not v10:match("Roact.Component") or not l_endsWith_0(v10, "function __update")) then
            v9 = v9 + 1;
        end;
    end);
    local v15 = l_concat_0(l_collectArray_0(v8, function(_, v12)
        local v14 = l_some_0(v6, function(v13)
            return v12:match(v13);
        end);
        if v14 then
            if not v12:match("Roact%.Component") or not l_endsWith_0(v12, "function setState") then
                if not v12:match("RoactRodux%.connect") then
                    if v12:match("Roact%.SingleEventManager") then
                        return "Roact event";
                    end;
                else
                    return "Rodux Store updated";
                end;
            else
                return "Roact.Component setState";
            end;
        end;
        return not v14 and v12 or nil;
    end), "\n");
    if v9 > 0 then
        return ("Update chain: %d component(s)\nTrigger:\n%s"):format(v9, v15);
    else
        return v15;
    end;
end;
