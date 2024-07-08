local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({}, {
    [require(l_Actions_0.PlayerAdded).name] = function(v5, v6)
        return l_Dictionary_0.join(v5, {
            [v6.userId] = v6.hasVerifiedBadge
        });
    end, 
    [require(l_Actions_0.PlayerRemoved).name] = function(v7, v8)
        return l_Dictionary_0.removeKey(v7, v8.userId);
    end
});
