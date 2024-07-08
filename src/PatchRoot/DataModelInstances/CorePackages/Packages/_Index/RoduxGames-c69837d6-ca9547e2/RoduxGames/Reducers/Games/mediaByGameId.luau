local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Models.GameMediaModel);
local v5 = {};
return function(v6)
    return v2.createReducer(v5, {
        [v6.networkingGames.GetExperienceMedia.Succeeded.name] = function(v7, v8)
            return v3.join(v7, {
                [tostring(v8.ids[1])] = v3.map(v8.responseBody.data, function(v9)
                    return v4.format(v9);
                end)
            });
        end
    });
end;
