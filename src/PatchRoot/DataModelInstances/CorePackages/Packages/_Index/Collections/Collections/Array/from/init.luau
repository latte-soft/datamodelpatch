local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.Set);
local v4 = require(l_Parent_1.Map.Map);
local v5 = require(l_Parent_0.isArray);
local v6 = require(l_Parent_2.InstanceOf);
local _ = require(l_Parent_2.ES7Types);
local v8 = require(script.fromString);
local v9 = require(script.fromSet);
local v10 = require(script.fromMap);
local v11 = require(script.fromArray);
return function(v12, v13, v14)
    if v12 == nil then
        error("cannot create array from a nil value");
    end;
    local v15 = typeof(v12);
    local _ = nil;
    if not (v15 == "table") or not v5(v12) then
        if not v6(v12, v3) then
            if not v6(v12, v4) then
                if v15 == "string" then
                    return (v8(v12, v13, v14));
                else
                    return {};
                end;
            else
                return (v10(v12, v13, v14));
            end;
        else
            return (v9(v12, v13, v14));
        end;
    else
        return (v11(v12, v13, v14));
    end;
end;
