local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
return (v1.createReducer({
    addedAssets = nil, 
    removedAssets = nil
}, {
    [require(l_Parent_0.Actions.AddAnalyticsInfo).name] = function(v4, v5)
        return v2.Dictionary.join(v4, v5.info);
    end, 
    [require(l_Parent_0.Actions.CloseOpenPrompt).name] = function(_, _)
        return {};
    end
}));
