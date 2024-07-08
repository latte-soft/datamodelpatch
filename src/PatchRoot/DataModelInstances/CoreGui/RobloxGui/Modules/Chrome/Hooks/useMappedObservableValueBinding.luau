local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.ChromeUtils);
return function(v2, v3)
    if v2 then
        local v4 = nil;
        v4 = v3 or function(v5)
            return v5;
        end;
        local v6, v7 = v0.useBinding(v4(v2:get()));
        v0.useEffect(function()
            local v8 = v2:connect(function()
                v7(v4(v2:get()));
            end);
            v7(v4(v2:get()));
            return function()
                v8:disconnect();
            end;
        end, {
            v2
        });
        return v6;
    else
        warn("observableValue undefined");
        return v0.useBinding(nil);
    end;
end;
