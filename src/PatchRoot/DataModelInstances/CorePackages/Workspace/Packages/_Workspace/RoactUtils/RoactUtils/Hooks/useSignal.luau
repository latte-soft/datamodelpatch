local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(script.Parent.dependencyArray);
return function(v4, v5)
    v1.useEffect(function()
        if v4 then
            assert(v4 ~= nil, "signal is not nil");
            local v6 = v4:connect(v5);
            return function()
                v6:disconnect();
            end;
        else
            return ;
        end;
    end, v3(v4, v5));
end;
