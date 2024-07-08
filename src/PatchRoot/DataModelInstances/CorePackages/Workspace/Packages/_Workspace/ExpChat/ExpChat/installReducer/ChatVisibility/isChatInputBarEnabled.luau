local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Flags.getTextChatServicePropertyTextBox);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v2.createReducer({
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _topBarVisibility = true, 
    _devTextBoxEnabled = false, 
    value = true
}, {
    [require(l_Actions_0.ChatInputBarConfigurationEnabled).name] = function(v6, v7)
        local _ = nil;
        return l_Dictionary_0.join(v6, {
            _propertyEnabled = v7.enabled, 
            value = if not v4() then (v6._topBarVisibility and v6._coreGuiEnabled) and v7.enabled else ((v6._topBarVisibility and v6._coreGuiEnabled) and not v6._devTextBoxEnabled) and v7.enabled
        });
    end, 
    [require(l_Actions_0.ChatTopBarButtonActivated).name] = function(v9, v10)
        local _ = nil;
        return l_Dictionary_0.join(v9, {
            _topBarVisibility = v10.isVisible, 
            value = if not v4() then (v9._propertyEnabled and v9._coreGuiEnabled) and v10.isVisible else ((v9._propertyEnabled and v9._coreGuiEnabled) and not v9._devTextBoxEnabled) and v10.isVisible
        });
    end, 
    [require(l_Actions_0.SetCoreGuiEnabledChanged).name] = function(v12, v13)
        local _ = nil;
        return l_Dictionary_0.join(v12, {
            _coreGuiEnabled = v13.enabled, 
            value = if not v4() then (v12._propertyEnabled and v12._topBarVisibility) and v13.enabled else ((v12._propertyEnabled and v12._topBarVisibility) and not v12._devTextBoxEnabled) and v13.enabled
        });
    end, 
    [require(l_Actions_0.DevTextBoxEnabledChanged).name] = function(v15, v16)
        if not v4() then
            return v15;
        else
            return l_Dictionary_0.join(v15, {
                _devTextBoxEnabled = v16.enabled, 
                value = ((v15._propertyEnabled and v15._topBarVisibility) and v15._coreGuiEnabled) and not v16.enabled
            });
        end;
    end, 
    [require(l_Actions_0.ClientAppLoaded).name] = function(v17, v18)
        local _ = nil;
        return l_Dictionary_0.join(v17, {
            _coreGuiEnabled = v18.isChatCoreGuiEnabled, 
            value = if not v4() then (v17._propertyEnabled and v17._topBarVisibility) and v18.isChatCoreGuiEnabled else ((v17._propertyEnabled and v17._topBarVisibility) and not v17._devTextBoxEnabled) and v18.isChatCoreGuiEnabled
        });
    end
});
