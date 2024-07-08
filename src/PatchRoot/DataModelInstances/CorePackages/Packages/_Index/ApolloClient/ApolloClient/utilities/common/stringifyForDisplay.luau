local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
local l_HttpService_0 = game:GetService("HttpService");
local l_makeUniqueId_0 = require(script.Parent.makeUniqueId).makeUniqueId;
replaceUndefined = function(v6, v7)
    if l_Array_0.isArray(v6) then
        local v8 = {};
        for v9 = 1, #v6 do
            if v6[v9] == nil then
                table.insert(v8, v7);
            else
                table.insert(v8, v6[v9]);
            end;
        end;
        return v8;
    else
        return v6;
    end;
end;
v0.stringifyForDisplay = function(v10)
    local v11 = l_makeUniqueId_0("stringifyForDisplay");
    return l_Array_0.join(l_String_0.split(l_HttpService_0:JSONEncode(replaceUndefined(v10, v11)), l_HttpService_0:JSONEncode(v11)), "<undefined>");
end;
return v0;
