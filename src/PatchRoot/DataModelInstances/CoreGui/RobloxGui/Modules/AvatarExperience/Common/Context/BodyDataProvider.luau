local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Util.makeEvents);
local v4 = require(script.Parent.BodyDataCallbacksContext);
local v5 = require(script.Parent.BodyDataEventsContext);
return function(v6)
    local v7, v8 = v2.useState({});
    local v9, v10 = v2.useState({});
    v2.useEffect(function()
        local v11, v12, v13 = v3({
            "setBodyColors"
        });
        v8(v11);
        v10(v12);
        return function()
            for _, v15 in v13, nil, nil do
                v15();
            end;
        end;
    end, {});
    return v2.createElement(v4.Provider, {
        value = v9
    }, {
        BodyDataEventsContextProvider = v2.createElement(v5.Provider, {
            value = v7
        }, v6.children)
    });
end;
