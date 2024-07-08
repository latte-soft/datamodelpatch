local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local _ = require(l_Parent_0.luaUtils.Response);
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local _ = require(script.Parent.Parent.core.types);
local l_throwServerError_0 = require(script.Parent.Parent.utils).throwServerError;
local v9 = require(l_Parent_0.luaUtils.hasOwnProperty);
v6.parseAndCheckHttpResponse = function(v10)
    return function(v11)
        return v11:text():andThen(function(v12)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v12), true;
            end);
            if not l_status_0 then
                local v15 = l_Error_0.new(l_result_0);
                v15.name = "ServerParseError";
                v15.response = v11;
                v15.statusCode = v11.status;
                v15.bodyText = v12;
                error(v15);
            end;
            return l_result_0;
        end):andThen(function(v16)
            if v11.status ~= nil and v11.status >= 300 then
                l_throwServerError_0(v11, v16, ("Response not successful: Received status code %s"):format((tostring(v11.status))));
            end;
            if not ((l_Array_0.isArray(v16) or v9(v16, "data")) or v9(v16, "errors")) then
                l_throwServerError_0(v11, v16, ("Server response was missing for query '%s'."):format(not not l_Array_0.isArray(v10) and l_Array_0.join(l_Array_0.map(v10, function(v17)
                    return v17.operationName;
                end), ", ") or v10.operationName));
            end;
            return v16;
        end);
    end;
end;
return v6;
