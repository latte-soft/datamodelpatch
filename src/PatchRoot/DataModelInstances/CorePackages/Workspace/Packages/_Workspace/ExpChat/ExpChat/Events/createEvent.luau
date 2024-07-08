local v0 = require(script.Parent.bindableEventQueue);
return function(v1)
    return function(v2)
        return function(...)
            local v3 = v2(...);
            if v1:GetAttribute("isConnected") ~= true then
                v0:add(v3);
                return ;
            else
                v1:Fire(v3);
                return ;
            end;
        end;
    end;
end;
