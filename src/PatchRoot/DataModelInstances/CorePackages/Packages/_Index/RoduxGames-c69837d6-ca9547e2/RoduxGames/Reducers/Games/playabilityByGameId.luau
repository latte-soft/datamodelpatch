local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Enums.PlayabilityStatus);
local v5 = {};
return function(v6)
    return v2.createReducer(v5, {
        [v6.networkingGames.GetExperiencesPlayabilityStatus.Succeeded.name] = function(v7, v8)
            return v3.reduce(v8.responseBody, function(v9, v10)
                return v3.join(v9, {
                    [v10.universeId] = v4.fromRawValue(v10.playabilityStatus)
                });
            end, v7);
        end
    });
end;
