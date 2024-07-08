local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_PartialSquadAdded_0 = require(l_script_FirstAncestor_0.Actions).PartialSquadAdded;
local l_PartialSquadRemoved_0 = require(l_script_FirstAncestor_0.Actions).PartialSquadRemoved;
local l_PartialSquadModel_0 = require(l_script_FirstAncestor_0.Models).PartialSquadModel;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
local v8 = {};
return function()
    return v3.createReducer(v8, {
        [l_PartialSquadAdded_0.name] = function(v9, v10)
            local v11 = l_PartialSquadModel_0.format(v10.payload.partialSquad);
            return v2.Dictionary.join(v9, {
                [v11.channelId] = v11
            });
        end, 
        [l_PartialSquadRemoved_0.name] = function(v12, v13)
            return v2.Dictionary.join(v12, {
                [v13.payload.channelId] = v2.None
            });
        end
    });
end;
