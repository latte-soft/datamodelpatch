local v0 = require(script.Parent.SetUserTyping);
local v1 = 0;
return function(v2, v3)
    return function(v4)
        spawn(function()
            v1 = v1 + 1;
            local l_v1_0 = v1;
            v4:dispatch(v0(v2, v3, true));
            wait(8);
            if v1 == l_v1_0 then
                v4:dispatch(v0(v2, v3, false));
            end;
        end);
    end;
end;
