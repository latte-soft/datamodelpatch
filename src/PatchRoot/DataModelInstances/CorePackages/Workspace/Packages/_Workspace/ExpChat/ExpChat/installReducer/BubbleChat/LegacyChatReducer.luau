local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v6 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v7 = require(script.Parent.LegacyDefaultSettings);
return v2.createReducer(v7, {
    [v5.name] = function(v8, v9)
        return l_Dictionary_0.join(v8, {
            Enabled = v9.value
        });
    end, 
    [v6.name] = function(_, v11)
        local l_chatSettings_0 = v11.chatSettings;
        if l_chatSettings_0.Transparency then
            l_chatSettings_0.BackgroundTransparency = l_chatSettings_0.Transparency;
        end;
        local v13 = l_Dictionary_0.join(v7, l_chatSettings_0);
        if not (not l_chatSettings_0 or not l_chatSettings_0.UserSpecificSettings) then
            for v14, v15 in pairs(l_chatSettings_0.UserSpecificSettings) do
                local v16 = l_Dictionary_0.copyDeep(v7);
                if v15.Transparency then
                    v15.BackgroundTransparency = v15.Transparency;
                end;
                v16.UserSpecificSettings = nil;
                v13.UserSpecificSettings[v14] = l_Dictionary_0.join(v16, v15);
            end;
        end;
        return v13;
    end
});
