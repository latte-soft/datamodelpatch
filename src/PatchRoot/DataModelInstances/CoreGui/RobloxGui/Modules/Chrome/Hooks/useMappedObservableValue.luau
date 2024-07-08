local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.ChromeUtils);
local v2 = require(script.Parent.Parent.Flags.GetFFlagChromeObservableStateCheck)();
return function(v3, v4)
    if v3 then
        local v5, v6 = v0.useState(v4(v3:get()));
        v0.useEffect(function()
            local v7 = v3:connect(function()
                v6(v4(v3:get()));
            end);
            if v2 then
                local v8 = v4(v3:get());
                if v5 ~= v8 then
                    v6(v8);
                end;
            end;
            return function()
                v7:disconnect();
            end;
        end, {
            v3
        });
        return v5;
    else
        warn("observableValue undefined");
        return nil;
    end;
end;
