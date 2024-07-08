local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = v3.PureComponent:extend("VoiceChatShield");
v8.getVoiceEnabledString = function(v9)
    if not v9.state.xboxMuteAllState then
        return v7:FormatByKey("DisableVoiceKey");
    else
        return v7:FormatByKey("EnableVoiceKey");
    end;
end;
v8.init = function(v10)
    v10.seenYButtonPressed = false;
    v10.shieldRef = v3.createRef();
    v10.state = {
        xboxMuteAllState = false
    };
    local v11 = require(l_RobloxGui_0.Modules.Shell.HintActionView)(nil, "ToggleVoiceChat", UDim2.new(0.96, -1, 0.96, -1));
    v11:SetText(v10:getVoiceEnabledString());
    v11:SetImage("rbxasset://textures/ui/Shell/ButtonIcons/YButton.png");
    v10.xboxToggleVoiceHotkey = v11;
end;
v8.render = function(v12)
    return l_WithLayoutValues_0(function(v13)
        return v3.createElement(v3.Portal, {
            target = l_RobloxGui_0
        }, {
            PlayerListShield = v3.createElement("Frame", {
                AutoLocalize = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v13.VoiceChatShieldColor, 
                BackgroundTransparency = v13.VoiceChatShieldTransparency, 
                Visible = v12.props.isVisible, 
                [v3.Ref] = v12.shieldRef
            })
        });
    end);
end;
v8.bindAction = function(v14)
    v14.xboxToggleVoiceHotkey:BindAction(function(_, v16, _)
        if v16 == Enum.UserInputState.Begin then
            v14.seenYButtonPressed = true;
            return ;
        else
            if not (not (v16 == Enum.UserInputState.End) or not v14.seenYButtonPressed) then
                v14:setState({
                    xboxMuteAllState = not v14.state.xboxMuteAllState
                });
                game:GetService("VoiceChatServiceXbox"):VoiceChatSetMuteAllState(v14.state.xboxMuteAllState);
                v14.xboxToggleVoiceHotkey:SetText(v14:getVoiceEnabledString());
                v14.seenYButtonPressed = false;
                local v18 = not v14.state.xboxMuteAllState and "XboxEnableVoiceChat" or "XboxDisableVoiceChat";
                l_RbxAnalyticsService_0:ReportCounter(v18, 1);
                l_RbxAnalyticsService_0:SetRBXEventStream("console", "XboxOne", v18, {});
            end;
            return ;
        end;
    end, Enum.KeyCode.ButtonY);
end;
v8.didMount = function(v19)
    v19.xboxToggleVoiceHotkey:SetParent(v19.shieldRef.current);
    if v19.props.isVisible then
        v19:bindAction();
    end;
end;
v8.didUpdate = function(v20, v21)
    if v20.props.isVisible ~= v21.isVisible then
        if not v20.props.isVisible then
            v20.xboxToggleVoiceHotkey:UnbindAction();
            v20.seenYButtonPressed = false;
        else
            v20:bindAction();
        end;
    end;
    v20.xboxToggleVoiceHotkey:SetParent(v20.shieldRef.current);
end;
v8.willUnmount = function(v22)
    v22.xboxToggleVoiceHotkey:UnbindAction();
end;
return v4.connect(function(v23)
    return {
        isVisible = v23.displayOptions.isVisible
    };
end, nil)(v8);
