local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v1.createReducer(false, {
    [require(l_Actions_0.ChatPrivacySettingsReceived).name] = function(_, v4)
        return v4.canUserChat;
    end, 
    [require(l_Actions_0.ChatPrivacySettingsFetchFailed).name] = function(_, _)
        return false;
    end
});
