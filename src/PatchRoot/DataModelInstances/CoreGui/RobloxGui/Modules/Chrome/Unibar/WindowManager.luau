local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script.Parent.Parent.Hooks.useChromeWindowItems);
local v2 = require(script.Parent.ComponentHosts.WindowHost);
return function(_)
    local v4 = v1();
    local v5 = {};
    for _, v7 in v4, nil, nil do
        v5["window_" .. v7.integration.id] = v0.createElement(v2, {
            position = v7.integration.startingWindowPosition, 
            integration = v7
        });
    end;
    return v5;
end;
