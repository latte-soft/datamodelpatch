local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return (v2.createReducer({}, {
    [v4.name] = function(v6, v7)
        local v8 = {};
        for v9, v10 in v7.payload, nil, nil do
            v8[v9] = v3.Dictionary.join(v6[v9] or {}, v10);
        end;
        return v3.Dictionary.join(v6, v8);
    end
}));
