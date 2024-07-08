local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.isArray);
local v3 = require(l_Parent_1.instanceof);
local v4 = require(l_Parent_1.Set);
local v5 = require(l_Parent_1.Map);
local v6 = require(script.fromString);
local v7 = require(script.fromSet);
local v8 = require(script.fromMap);
local v9 = require(script.fromArray);
local _ = require(l_Parent_1.types);
return function(v11, v12, v13)
    if v11 == nil then
        error("cannot create array from a nil value");
    end;
    local v14 = typeof(v11);
    local _ = nil;
    if not (v14 == "table") or not v2(v11) then
        if not v3(v11, v4) then
            if not v3(v11, v5) then
                if v14 == "string" then
                    return (v6(v11, v12, v13));
                else
                    return {};
                end;
            else
                return (v8(v11, v12, v13));
            end;
        else
            return (v7(v11, v12, v13));
        end;
    else
        return (v9(v11, v12, v13));
    end;
end;
