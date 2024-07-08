local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v7 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.ReactIs);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v13 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
if v12() then
    v7 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
    v13 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v15 = v8.PureComponent:extend("VoiceIndicator");
v15.validateProps = v11.strictInterface({
    onClicked = v11.optional(v11.callback), 
    userId = v11.string, 
    hideOnError = v11.optional(v11.boolean), 
    size = v11.optional(v11.UDim2), 
    iconStyle = v11.optional(v11.union(v11.literal("MicDark"), v11.literal("MicLight"), v11.literal("SpeakerDark"), v11.literal("SpeakerLight"))), 
    iconTransparency = v11.optional(v11.union(v11.number, v11.table)), 
    voiceState = v11.string
});
v15.defaultProps = {};
v15.getIcon = function(_, v17)
    return "rbxasset://textures/ui/VoiceChat/" .. v17 .. ".png";
end;
v15.init = function(v18)
    local v19, v20 = v8.createBinding(0);
    v18.level = v19;
    v18.updateLevel = v20;
    v19, v20 = v8.createBinding(v18.props.voiceState);
    v18.voiceState = v19;
    v18.updateVoiceState = v20;
    v18.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v18.renderStepName, 1, function()
        v18.updateLevel(math.random());
    end);
    v18.levelIcon = v8.joinBindings({
        v18.voiceState, 
        v18.level
    }):map(function(v21)
        local v22 = v21[1];
        local v23 = v21[2];
        if not (v22 ~= v13.VOICE_STATE.MUTED) or v22 == v13.VOICE_STATE.LOCAL_MUTED then
            return l_default_0:GetIcon("Muted", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v18.props.iconStyle);
        elseif v22 == v13.VOICE_STATE.TALKING then
            return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v23)), v18.props.iconStyle);
        else
            return l_default_0:GetIcon("Error", v18.props.iconStyle);
        end;
    end);
end;
v15.renderWithSelectionCursor = function(v24, v25)
    local v26 = true;
    if v24.props.voiceState ~= v13.VOICE_STATE.ERROR then
        v26 = v24.props.voiceState == v13.VOICE_STATE.HIDDEN;
    end;
    if not v24.props.hideOnError or v24.props.voiceState and not v26 then
        local v27 = v24.props.voiceState == v13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0;
        if v24.props.iconTransparency then
            local l_v27_0 = v27;
            v27 = if not v9.isBinding(v24.props.iconTransparency) then 1 - (1 - v24.props.iconTransparency) * (1 - l_v27_0) else v24.props.iconTransparency:map(function(v29)
                return 1 - (1 - v29) * (1 - l_v27_0);
            end);
        end;
        return v8.createElement("ImageButton", {
            Size = v24.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v24.levelIcon, 
            ImageTransparency = v27, 
            SelectionImageObject = v25(l_CursorKind_0.RoundedRectNoInset), 
            [v8.Event.Activated] = v24.props.onClicked
        });
    else
        return nil;
    end;
end;
v15.render = function(v30)
    return l_withSelectionCursorProvider_0(function(v31)
        return v30:renderWithSelectionCursor(v31);
    end);
end;
v15.didUpdate = function(v32, v33, _)
    v7:trace("Voice state updated to {} for ...{}", v32.props.voiceState, (string.sub(tostring(v32.props.userId), -4)));
    if v33.voiceState ~= v32.props.voiceState then
        v32.updateVoiceState(v32.props.voiceState);
    end;
end;
v15.willUnmount = function(v35)
    pcall(function()
        l_RunService_0:UnbindFromRenderStep(v35.renderStepName);
    end);
end;
return v10.connect(function(v36, v37)
    return {
        voiceState = v36.voiceState[v37.userId]
    };
end)(v15);
