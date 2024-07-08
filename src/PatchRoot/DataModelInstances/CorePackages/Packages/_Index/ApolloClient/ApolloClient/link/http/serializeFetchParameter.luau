local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Array_0 = v1.Array;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = {};
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
v5.serializeFetchParameter = function(v7, v8, v9)
    local v10 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if not (l_Array_0.isArray(v7) and #v7 == 0) or not v9 then
            v10 = l_HttpService_0:JSONEncode(v7);
            return ;
        else
            v10 = "{}";
            return ;
        end;
    end);
    if not l_status_0 then
        local v13 = l_InvariantError_0.new(("Network request failed. %s is not serializable: %s"):format(v8, l_result_0));
        v13.parseError = l_Error_0.new(l_result_0);
        error(v13);
    end;
    return v10;
end;
return v5;
