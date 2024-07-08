local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_SuggestedCalleeModel_0 = require(l_script_FirstAncestor_0.Models).SuggestedCalleeModel;
local l_ClearSuggestedCallees_0 = require(l_script_FirstAncestor_0.Actions).ClearSuggestedCallees;
local _ = require(script.Parent.Parent.roduxCallTypes);
local v5 = {
    suggestedCallees = {}
};
return function(v6)
    return v1.createReducer(v5, {
        [v6.NetworkingCall.GetSuggestedCallees.Succeeded.name] = function(_, v8)
            local l_suggestedCallees_0 = v8.responseBody.suggestedCallees;
            local v10 = {};
            for _, v12 in ipairs(l_suggestedCallees_0) do
                assert(l_SuggestedCalleeModel_0.isValid(v12));
                v10[#v10 + 1] = l_SuggestedCalleeModel_0.format(v12);
            end;
            return {
                suggestedCallees = v10
            };
        end, 
        [l_ClearSuggestedCallees_0.name] = function(_, _)
            return v5;
        end
    });
end;
