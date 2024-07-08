local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    local v6 = {};
    if type(v5) == "string" then
        v6.body = v5;
    elseif v5 == nil then
        v6.body = nil;
    else
        error(string.format("Expected string or nil as the first argument to Body.new(), but got: %s", (type(v5))));
    end;
    v6.bodyUsed = false;
    setmetatable(v6, v4);
    return v6;
end;
v4.arrayBuffer = function(_)
    return v2.new(function(_, v9)
        v9("arrayBuffer not implemented");
    end);
end;
v4.blob = function(_)
    return v2.new(function(_, v12)
        v12("blob not implemented");
    end);
end;
v4.formData = function(_)
    return v2.new(function(_, v15)
        v15("formData not implemented");
    end);
end;
v4.json = function(v16)
    return v2.new(function(v17, v18)
        if not v16._json then
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:JSONDecode(v16.body);
            end);
            if l_status_0 then
                v16._json = l_result_0;
                v17(l_result_0);
                return ;
            else
                v18("Failed to decode response body as JSON. JSON decoding is only supported for Content-Type = application/json");
                return ;
            end;
        else
            v17(v16._json);
            return ;
        end;
    end);
end;
v4.text = function(v21)
    return v2.new(function(v22, _)
        v22(v21.body or "");
    end);
end;
return {
    Body = v4
};
