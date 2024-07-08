local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local v5 = {};
local v6 = require(l_Parent_0.Picomatch);
local _ = require(l_Parent_0.JestTypes);
local v8 = l_Map_0.new();
local v9 = {
    dot = true
};
v5.default = function(v10)
    if #v10 == 0 then
        return function()
            return false;
        end;
    else
        local v13 = l_Array_0.map(v10, function(v11)
            if not v8:has(v11) then
                local v12 = v6(v11, v9, true);
                v8:set(v11, {
                    isMatch = v12, 
                    negated = v12.state.negated or l_Boolean_0.toJSBoolean(v12.state.negatedExtglob)
                });
            end;
            return (v8:get(v11));
        end);
        return function(v14)
            local v15 = nil;
            local v16 = 0;
            for v17 = 1, #v13 do
                local v18 = nil;
                local v19 = nil;
                local v20 = v13[v17];
                v18 = v20.isMatch;
                v19 = v20.negated;
                if v19 then
                    v16 = v16 + 1;
                end;
                local v21 = v18(v14);
                if v21 or not v19 then
                    if not (not v21 or v19) then
                        v15 = true;
                    end;
                else
                    v15 = false;
                end;
            end;
            if v16 == #v13 then
                return v15 ~= false;
            else
                return (l_Boolean_0.toJSBoolean(v15));
            end;
        end;
    end;
end;
return v5;
