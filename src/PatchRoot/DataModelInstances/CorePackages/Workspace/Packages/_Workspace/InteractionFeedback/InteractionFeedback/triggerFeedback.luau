local v0 = require(script:FindFirstAncestor("InteractionFeedback").Parent.SoundManager);
local l_SoundManager_0 = v0.SoundManager;
local l_Sounds_0 = v0.Sounds;
local l_SoundGroups_0 = v0.SoundGroups;
local _ = require(script.Parent.InteractionFeedbackContext);
local v5 = require(script.Parent.triggerHaptic);
l_SoundManager_0.init();
return function(v6, v7, v8, v9)
    if not v8 then
        error("No config table was provided to InteractionFeedbackManager. Something is wrong.");
    end;
    local v10 = v8[v6];
    if v10 then
        local v11 = v10[v7];
        if v11 then
            local l_Sound_0 = v11.Sound;
            if l_Sound_0 then
                local v13 = l_Sounds_0[l_Sound_0];
                if not v13 then
                    error("Sound " .. l_Sound_0 .. " not found in SoundManager given contextKey: " .. v6 .. " and interactionType: " .. tostring(v7) .. ". Please check the Sounds.lua file.");
                end;
                l_SoundManager_0:PlaySound(v13.Name, {}, l_SoundGroups_0.AppBackground);
            end;
            local l_Haptic_0 = v11.Haptic;
            if l_Haptic_0 then
                v5(l_Haptic_0, v9);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
