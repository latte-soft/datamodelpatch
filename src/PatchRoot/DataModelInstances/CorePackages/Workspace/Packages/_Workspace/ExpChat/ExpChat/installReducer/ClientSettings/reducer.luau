local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    preferredTransparency = 1
}, {
    [require(l_Actions_0.ClientSettingsLoaded).name] = function(v5, v6)
        return l_Dictionary_0.join(v5, v6.value);
    end, 
    [require(l_Actions_0.ClientSettingsChanged).name] = function(v7, v8)
        return l_Dictionary_0.join(v7, {
            [v8.property] = v8.value
        });
    end
});
