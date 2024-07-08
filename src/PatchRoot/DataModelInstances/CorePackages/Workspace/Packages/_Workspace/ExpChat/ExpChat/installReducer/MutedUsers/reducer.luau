local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Set_0 = require(l_Parent_0.llama).Set;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({}, {
    [require(l_Actions_0.UserMuted).name] = function(v5, v6)
        return l_Set_0.add(v5, v6.userId);
    end, 
    [require(l_Actions_0.UserUnmuted).name] = function(v7, v8)
        return l_Set_0.subtract(v7, v8.userId);
    end
});
