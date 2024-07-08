local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local l_HttpService_0 = game:GetService("HttpService");
sortedEncode = function(v4)
    if not l_Array_0.isArray(v4) and typeof(v4) == "table" then
        return "{" .. l_Array_0.join(l_Array_0.map(l_Array_0.sort(l_Object_0.keys(v4)), function(v5)
            return l_HttpService_0:JSONEncode(v5) .. ":" .. sortedEncode(v4[v5]);
        end), ",") .. "}";
    else
        return l_HttpService_0:JSONEncode(v4);
    end;
end;
return {
    sortedEncode = sortedEncode
};
