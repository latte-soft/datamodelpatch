local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({}, {
    [require(l_Actions_0.PlayerAdded).name] = function(v6, v7)
        local v8 = string.lower(v7.displayName);
        return l_Dictionary_0.join(v6, {
            [v8] = l_List_0.append(v6[v8] or {}, v7.userId)
        });
    end, 
    [require(l_Actions_0.PlayerRemoved).name] = function(v9, v10)
        return l_Dictionary_0.map(v9, function(v11)
            return l_List_0.removeValue(v11, v10.userId);
        end);
    end
});
