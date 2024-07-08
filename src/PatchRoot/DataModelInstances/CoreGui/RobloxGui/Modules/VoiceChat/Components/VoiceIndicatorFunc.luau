local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.ReactIs);
local v9 = require(l_CorePackages_0.UIBlox);
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v12 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v13 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v13 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v15 = UDim2.fromOffset(28, 28);
local function _(v16)
    return v7.useMemo(function()
        return v6.joinBindings(v16);
    end, {});
end;
local function _(v18, v19)
    return function(v20)
        local v21 = v20[1];
        local v22 = v20[2];
        if not (v21 ~= v13.VOICE_STATE.MUTED) or v21 == v13.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v18);
        elseif v21 == v13.VOICE_STATE.CONNECTING then
            if v19 and v18 == "MicLight" then
                return l_default_0:GetIcon("Connecting", "MicDark");
            else
                return l_default_0:GetIcon("Connecting", v18);
            end;
        elseif v21 == v13.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v18);
        elseif v21 == v13.VOICE_STATE.TALKING then
            return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v22)), v18);
        else
            return l_default_0:GetIcon("Error", v18);
        end;
    end;
end;
local v24 = {
    [v13.VOICE_STATE.ERROR] = true, 
    [v13.VOICE_STATE.HIDDEN] = true
};
local function v25()
    return l_HttpService_0:GenerateGUID();
end;
local function v27(v26)
    return (l_TweenService_0:Create(v26:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), {
        Offset = Vector2.new(1, 0)
    }));
end;
return function(v28)
    local v29 = v12(v28.userId, v28.disable or false);
    local v30, v31 = v7.useBinding(0);
    local v32 = not (v28.selectable ~= nil) or v28.selectable;
    local v33, v34 = v7.useBinding(v29);
    local v35 = {
        v33, 
        v30
    };
    local l_v35_0 = v35 --[[ copy: 8 -> 16 ]];
    local v37 = v7.useMemo(function()
        return v6.joinBindings(l_v35_0);
    end, {});
    v35 = v7.useRef(v25()).current or "";
    v34(v29);
    local v38 = v29 == v13.VOICE_STATE.TALKING;
    local v39 = v29 == v13.VOICE_STATE.CONNECTING;
    local v40 = v28.showConnectingShimmer == true;
    local v41 = v7.useRef(nil);
    v7.useEffect(function()
        if (not v40 or not v39) or not v41.current then
            return function()
            end;
        else
            local v42 = v27(v41);
            v42:Play();
            return function()
                v42:Cancel();
            end;
        end;
    end, {
        v39, 
        v40
    });
    v7.useEffect(function()
        if v38 then
            l_RunService_0:BindToRenderStep(v35, 1, function()
                v31(math.random());
            end);
        end;
        return function()
            if v38 then
                l_RunService_0:UnbindFromRenderStep(v35);
            end;
        end;
    end, {
        v38
    });
    local v43 = not (v28.hideOnError and (not v29 or v24[v29]));
    local v44 = v29 == v13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
    if v28.iconTransparency then
        local l_v44_0 = v44;
        v44 = if not v8.isBinding(v28.iconTransparency) then 1 - (1 - v28.iconTransparency) * (1 - l_v44_0) else v28.iconTransparency:map(function(v46)
            return 1 - (1 - v46) * (1 - l_v44_0);
        end);
    end;
    return v6.createElement("ImageButton", {
        Size = v28.size or v15, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v7.useMemo(function()
            local l_v37_0 = v37;
            local l_iconStyle_0 = v28.iconStyle;
            local l_v40_0 = v40;
            return l_v37_0:map(function(v50)
                local v51 = v50[1];
                local v52 = v50[2];
                if not (v51 ~= v13.VOICE_STATE.MUTED) or v51 == v13.VOICE_STATE.LOCAL_MUTED then
                    return l_default_0:GetIcon("Muted", l_iconStyle_0);
                elseif v51 == v13.VOICE_STATE.CONNECTING then
                    if l_v40_0 and l_iconStyle_0 == "MicLight" then
                        return l_default_0:GetIcon("Connecting", "MicDark");
                    else
                        return l_default_0:GetIcon("Connecting", l_iconStyle_0);
                    end;
                elseif v51 == v13.VOICE_STATE.INACTIVE then
                    return l_default_0:GetIcon("Unmuted0", l_iconStyle_0);
                elseif v51 == v13.VOICE_STATE.TALKING then
                    return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v52)), l_iconStyle_0);
                else
                    return l_default_0:GetIcon("Error", l_iconStyle_0);
                end;
            end);
        end, {
            v28.iconStyle
        }), 
        ImageTransparency = v44, 
        Selectable = v32, 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
        Visible = v43, 
        [v6.Event.Activated] = v28.onClicked
    }, {
        ShimmerGradient = if not v40 then nil else v6.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
            }), 
            Enabled = v39, 
            Rotation = -45, 
            Offset = Vector2.new(-1, 0), 
            [v6.Ref] = v41
        })
    });
end;
