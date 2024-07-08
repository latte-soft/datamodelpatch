local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Models.ProductModel);
local v5 = {};
return function(v6)
    return v2.createReducer(v5, {
        [v6.networkingGames.GetExperiencesProductInfo.Succeeded.name] = function(v7, v8)
            return v3.reduce(v8.responseBody.data, function(v9, v10)
                return v3.join(v9, {
                    [tostring(v10.universeId)] = v4.format(v10)
                });
            end, v7);
        end
    });
end;
