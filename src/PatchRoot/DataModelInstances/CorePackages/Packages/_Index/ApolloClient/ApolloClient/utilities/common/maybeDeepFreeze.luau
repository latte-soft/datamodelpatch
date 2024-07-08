local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_Array_0 = v1.Array;
require(script.Parent.Parent.globals);
local l_isNonNullObject_0 = require(script.Parent.objects).isNonNullObject;
local function v11(v6)
    local v7 = l_Set_0.new({
        v6
    });
    for _, v9 in v7, nil, nil do
        if l_isNonNullObject_0(v9) then
            if not table.isfrozen(v9) then
                l_Object_0.freeze(v9);
            end;
            l_Array_0.forEach(l_Object_0.keys(v9), function(v10)
                if l_isNonNullObject_0(v9[v10]) then
                    v7:add(v9[v10]);
                end;
            end);
        end;
    end;
    return v6;
end;
v0.maybeDeepFreeze = function(v12)
    if _G.__DEV__ then
        v11(v12);
    end;
    return v12;
end;
return v0;
