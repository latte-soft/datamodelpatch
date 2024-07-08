local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.ChromeUtils);
return function(v2)
    local v3, v4 = v0.useState(v2:get());
    v0.useEffect(function()
        local v6 = v2:connect(function(v5)
            v4(v5);
        end);
        if v3 ~= v2:get() then
            v4(v2:get());
        end;
        return function()
            v6:disconnect();
        end;
    end, {
        v2
    });
    return v3;
end;
