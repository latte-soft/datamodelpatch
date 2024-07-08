local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
return (require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion).name] = function(v3, v4)
        return (v2.Dictionary.join(v3, {
            [v4.prefix] = v4.autocompleteSuggestions
        }));
    end
}));
