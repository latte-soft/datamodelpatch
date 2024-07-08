local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v6 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local v7 = require(l_Actions_0.ClientAppLoaded);
local v8 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v9 = require(l_script_FirstAncestor_0.Flags.getTextChatServicePropertyTextBox);
return v2.createReducer({
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _devTextBoxEnabled = false, 
    value = true
}, {
    [v5.name] = function(v10, v11)
        local _ = nil;
        return l_Dictionary_0.join(v10, {
            _propertyEnabled = v11.enabled, 
            value = if not v9() then v10._coreGuiEnabled and v11.enabled else (v10._coreGuiEnabled and not v10._devTextBoxEnabled) and v11.enabled
        });
    end, 
    [v6.name] = function(v13, v14)
        local _ = nil;
        return l_Dictionary_0.join(v13, {
            _coreGuiEnabled = v14.enabled, 
            value = if not v9() then v13._propertyEnabled and v14.enabled else (v13._propertyEnabled and not v13._devTextBoxEnabled) and v14.enabled
        });
    end, 
    [v8.name] = function(v16, v17)
        if not v9() then
            return v16;
        else
            return l_Dictionary_0.join(v16, {
                _devTextBoxEnabled = v17.enabled, 
                value = (v16._propertyEnabled and v16._coreGuiEnabled) and not v17.enabled
            });
        end;
    end, 
    [v7.name] = function(v18, v19)
        local _ = nil;
        return l_Dictionary_0.join(v18, {
            _coreGuiEnabled = v19.isChatCoreGuiEnabled, 
            value = if not v9() then v18._propertyEnabled and v19.isChatCoreGuiEnabled else (v18._propertyEnabled and not v18._devTextBoxEnabled) and v19.isChatCoreGuiEnabled
        });
    end
});
