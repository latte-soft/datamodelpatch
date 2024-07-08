local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script.Parent.TopBarPageContent);
local v2 = require(script.Parent.TopBarContentFrame);
return function(v3)
    local l_topBarSlot_0 = v3.topBarSlot;
    local v5 = table.clone(v3);
    v5.topBarSlot = nil;
    if not l_topBarSlot_0 then
        return v0.createElement(v2, v5);
    else
        return v0.createElement(v0.Fragment, nil, {
            TopBar = l_topBarSlot_0, 
            TopBarPageContent = v0.createElement(v1, v5)
        });
    end;
end;
