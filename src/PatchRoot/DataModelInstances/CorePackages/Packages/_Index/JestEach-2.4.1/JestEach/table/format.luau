local l_NaN_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Number.NaN;
local l_HttpService_0 = game:GetService("HttpService");
return function(...)
    local v2 = 2;
    local v3 = {
        ...
    };
    local v4 = v3[1];
    local v5 = #v3;
    return (v4:gsub("%%[sdj%%]", function(v6)
        if v6 == "%%" then
            return "%";
        elseif v5 < v2 then
            return v6;
        elseif v6 == "%s" then
            local v7 = nil;
            v7 = typeof(v3[v2]) == "function" and "Function" or tostring(v3[v2]);
            v2 = v2 + 1;
            return v7;
        elseif v6 == "%d" then
            local v8 = tonumber(v3[v2]) or l_NaN_0;
            v2 = v2 + 1;
            return (tostring(v8));
        elseif v6 == "%j" then
            local l_status_0, l_result_0 = pcall(function()
                local v9 = l_HttpService_0:JSONEncode(v3[v2]);
                v2 = v2 + 1;
                return v9;
            end);
            if l_status_0 then
                return l_result_0;
            else
                v2 = v2 + 1;
                return "[Circular]";
            end;
        else
            return v6;
        end;
    end));
end;
