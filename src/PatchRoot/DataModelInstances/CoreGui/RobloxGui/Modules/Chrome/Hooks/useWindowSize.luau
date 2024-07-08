local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.Types);
return function(v2)
    if not v2 or not v2.windowSize then
        warn("windowSize object not found");
        return UDim2.new();
    else
        local l_windowSize_0 = v2.windowSize;
        local v4, v5 = v0.useState(l_windowSize_0:get());
        v0.useEffect(function()
            local v6 = l_windowSize_0:connect(function()
                v5(l_windowSize_0:get());
            end);
            if v4 ~= l_windowSize_0:get() then
                v5(l_windowSize_0:get());
            end;
            return function()
                v6:disconnect();
            end;
        end, {
            v2.id
        });
        return v4;
    end;
end;
