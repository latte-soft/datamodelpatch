local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _topBarVisibility = true, 
    value = true
}, {
    [require(l_Actions_0.ChatWindowConfigurationEnabled).name] = function(v5, v6)
        return l_Dictionary_0.join(v5, {
            _propertyEnabled = v6.enabled, 
            value = (v5._topBarVisibility and v5._coreGuiEnabled) and v6.enabled
        });
    end, 
    [require(l_Actions_0.ChatTopBarButtonActivated).name] = function(v7, v8)
        return l_Dictionary_0.join(v7, {
            _topBarVisibility = v8.isVisible, 
            value = (v7._propertyEnabled and v7._coreGuiEnabled) and v8.isVisible
        });
    end, 
    [require(l_Actions_0.SetCoreGuiEnabledChanged).name] = function(v9, v10)
        return l_Dictionary_0.join(v9, {
            _coreGuiEnabled = v10.enabled, 
            value = (v9._propertyEnabled and v9._topBarVisibility) and v10.enabled
        });
    end, 
    [require(l_script_FirstAncestor_0.Actions.ClientAppLoaded).name] = function(v11, v12)
        return l_Dictionary_0.join(v11, {
            _coreGuiEnabled = v12.isChatCoreGuiEnabled, 
            value = (v11._propertyEnabled and v11._topBarVisibility) and v12.isChatCoreGuiEnabled
        });
    end
});
