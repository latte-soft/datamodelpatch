local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(script.Parent.Parent.Constants);
local v9 = require(script.Parent.Parent.Logger)(script.Name);
local v10 = require(script.Parent.BubbleChatBillboard);
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting);
local v12 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v13 = v4.Component:extend("ChatBillboards");
v13.validateProps = v6.strictInterface({
    userMessages = v6.map(v6.string, v6.array(v6.string)), 
    bubbleChatEnabled = v6.boolean, 
    voiceEnabled = v6.boolean, 
    participants = v6.map(v6.string, v6.string)
});
v13.getDerivedStateFromProps = function(v14, v15)
    return {
        userMessages = v7.Dictionary.join(v15.userMessages or {}, v14.userMessages)
    };
end;
v13.init = function(v16)
    v9:debug("Initializing");
    v16:setState({
        userMessages = {}
    });
    v16.onBillboardFadeOut = function(v17)
        v16:setState({
            userMessages = v7.Dictionary.join(v16.state.userMessages, {
                [v17] = v7.None
            })
        });
    end;
end;
v13.render = function(v18)
    if (v18.props.voiceEnabled or v18.props.bubbleChatEnabled) or v12 then
        local v19 = {};
        for v20, _ in pairs(v18.state.userMessages) do
            v19[v20] = false;
        end;
        for v22, v23 in pairs(v18.props.participants) do
            if v23 ~= v8.VOICE_STATE.HIDDEN then
                v19[v22] = true;
            end;
        end;
        if v12 then
            v19[tostring(l_Players_0.LocalPlayer.UserId)] = true;
        end;
        local v24 = {};
        for v25, v26 in pairs(v19) do
            v9:trace("Rendering billboard for ...{}", (string.sub(tostring(v25), -4)));
            v24["BubbleChat_" .. v25] = v4.createElement(v10, {
                userId = v25, 
                onFadeOut = v18.onBillboardFadeOut, 
                voiceEnabled = v18.props.voiceEnabled and v26, 
                bubbleChatEnabled = v18.props.bubbleChatEnabled
            });
        end;
        return v4.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, v24);
    else
        return ;
    end;
end;
return v5.connect(function(v27)
    local l_voiceEnabled_0 = v27.components.voiceEnabled;
    if v11() then
        l_voiceEnabled_0 = v27.components.voiceEnabled and v27.chatSettings.Voice.ShowIndicator;
    end;
    return {
        userMessages = v27.userMessages, 
        voiceEnabled = l_voiceEnabled_0, 
        bubbleChatEnabled = v27.components.bubbleChatEnabled, 
        participants = v27.voiceState
    };
end)(v13);
