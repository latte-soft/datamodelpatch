local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer(require(script.Parent.DefaultSettings), {
    [require(l_Actions_0.ConfigurationObjectsLoaded).name] = function(v5, v6)
        return l_Dictionary_0.join(v5, v6.bubbleChatSettings);
    end, 
    [require(l_Actions_0.BubbleChatSettingsChanged).name] = function(v7, v8)
        return l_Dictionary_0.join(v7, {
            [v8.property] = v8.value
        });
    end, 
    [require(l_Actions_0.BubbleChatChildSettingChanged).name] = function(v9, v10)
        return l_Dictionary_0.join(v9, {
            [v10.childName] = l_Dictionary_0.join(v9[v10.childName], {
                [v10.property] = v10.value
            })
        });
    end, 
    [require(l_Actions_0.BubbleChatChildRemoved).name] = function(v11, v12)
        return l_Dictionary_0.removeKey(v11, v12.childName);
    end
});
