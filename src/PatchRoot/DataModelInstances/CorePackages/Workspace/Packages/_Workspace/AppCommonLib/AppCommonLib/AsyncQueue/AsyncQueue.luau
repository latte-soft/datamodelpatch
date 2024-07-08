local v0 = require(script:FindFirstAncestor("AppCommonLib").Parent.Promise);
local _ = require(script.Parent.AsyncQueueTypes);
local v2 = {};
v2.__index = v2;
v2.new = function()
    local v3 = {
        head = v0.resolve()
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.request = function(v4, v5)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v7 = false;
    local v8 = false;
    v4.head = v4.head:andThen(function()
        return v0.new(function(v9)
            if not v7 then
                pcall(v5);
            end;
            if not v7 then
                v8 = true;
                l_BindableEvent_0.Event:Wait();
            end;
            l_BindableEvent_0:Destroy();
            v9();
        end);
    end);
    return function()
        if not v8 then
            v7 = true;
            return ;
        else
            l_BindableEvent_0:Fire();
            return ;
        end;
    end;
end;
return v2;
