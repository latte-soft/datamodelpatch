local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v7 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v7 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v9 = UDim2.fromOffset(36, 36);
local function _(v10)
    return v5.useMemo(function()
        return v4.joinBindings(v10);
    end, {});
end;
local function _(v12)
    return function(v13)
        local v14 = v13[1];
        local v15 = v13[2];
        if not (v14 ~= v7.VOICE_STATE.MUTED) or v14 == v7.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v12);
        elseif v14 == v7.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v12);
        elseif v14 == v7.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v12);
        elseif v14 == v7.VOICE_STATE.TALKING then
            return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v15)), v12);
        else
            return l_default_0:GetIcon("Error", v12);
        end;
    end;
end;
local function v17()
    return l_HttpService_0:GenerateGUID();
end;
return function(v18)
    local v19 = v6(v18.userId, v18.disable or false);
    local v20, v21 = v5.useBinding(0);
    local v22, v23 = v5.useBinding(v19);
    local v24 = {
        v22, 
        v20
    };
    local l_v24_0 = v24 --[[ copy: 7 -> 9 ]];
    local v26 = v5.useMemo(function()
        return v4.joinBindings(l_v24_0);
    end, {});
    v24 = v5.useRef(v17()).current or "";
    v23(v19);
    local v27 = v19 == v7.VOICE_STATE.TALKING;
    v5.useEffect(function()
        if v27 then
            l_RunService_0:BindToRenderStep(v24, 1, function()
                v21(math.random());
            end);
        end;
        return function()
            if v27 then
                l_RunService_0:UnbindFromRenderStep(v24);
            end;
        end;
    end, {
        v27
    });
    return v4.createElement("ImageLabel", {
        BackgroundTransparency = v18.BackgroundTransparency or 1, 
        Image = v5.useMemo(function()
            local l_v26_0 = v26;
            local l_iconStyle_0 = v18.iconStyle;
            return l_v26_0:map(function(v30)
                local v31 = v30[1];
                local v32 = v30[2];
                if not (v31 ~= v7.VOICE_STATE.MUTED) or v31 == v7.VOICE_STATE.LOCAL_MUTED then
                    return l_default_0:GetIcon("Muted", l_iconStyle_0);
                elseif v31 == v7.VOICE_STATE.CONNECTING then
                    return l_default_0:GetIcon("Connecting", l_iconStyle_0);
                elseif v31 == v7.VOICE_STATE.INACTIVE then
                    return l_default_0:GetIcon("Unmuted0", l_iconStyle_0);
                elseif v31 == v7.VOICE_STATE.TALKING then
                    return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v32)), l_iconStyle_0);
                else
                    return l_default_0:GetIcon("Error", l_iconStyle_0);
                end;
            end);
        end, {
            v18.iconStyle
        }), 
        ImageColor3 = v18.ImageColor3, 
        ImageTransparency = v18.ImageTransparency, 
        Position = v18.Position, 
        Size = v18.Size or v9, 
        [v4.Children] = v18[v4.Children]
    });
end;
