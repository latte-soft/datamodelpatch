local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.ChromeUtils);
local v2 = require(script.Parent.Parent.Flags.GetFFlagChromeObservableStateCheck)();
return function(v3)
    if v3 then
        local v4, v5 = v0.useState(v3:get());
        v0.useEffect(function()
            local v6 = v3:connect(function()
                v5(v3:get());
            end);
            if v2 and v4 ~= v3:get() then
                v5(v3:get());
            end;
            return function()
                v6:disconnect();
            end;
        end, {
            v3
        });
        return v4;
    else
        warn("observableValue undefined");
        return nil;
    end;
end;
