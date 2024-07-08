local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(script.Parent.jsHelpers.stripAnsi);
local _ = require(l_Parent_0.JestTypes);
local l_formatExecError_0 = require(l_Parent_0.JestMessageUtil).formatExecError;
v5.formatHandleErrors = function(v9, v10)
    local v11 = l_Set_0.new();
    return l_Array_0.filter(l_Array_0.map(v9, function(v12)
        return l_formatExecError_0(v12, v10, {
            noStackTrace = false
        }, nil, true);
    end), function(v13)
        local v14 = v6(v13);
        local v15 = string.match(v14, "%s+at(.*)");
        if v15 == nil then
            return true;
        else
            local v16 = l_String_0.trim((string.sub(v14, (string.find(v14, v15)))));
            if not v11:has(v16) then
                v11:add(v16);
                return true;
            else
                return false;
            end;
        end;
    end);
end;
return v5;
