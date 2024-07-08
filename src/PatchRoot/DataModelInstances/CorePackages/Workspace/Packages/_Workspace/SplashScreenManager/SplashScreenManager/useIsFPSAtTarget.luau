local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script.Parent.SplashScreenManager);
return function()
    local v2, v3 = v0.useState(v1.isFPSAtTarget());
    local v5 = v0.useCallback(function(v4)
        v3(v4);
    end, {
        v3
    });
    v0.useEffect(function()
        v1.addStatusChangeListener(v5);
        return function()
            v1.removeStatusChangeListener(v5);
        end;
    end, {});
    return v2;
end;
