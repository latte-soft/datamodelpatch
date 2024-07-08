local v0 = not not game:GetEngineFeature("VoiceChatSupported") and Enum.VoiceChatState.Ended or nil;
local v1 = {
    voiceEnabled = false, 
    voiceState = v0
};
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = v4.createContext(v1);
return {
    Provider = function(v7)
        local v8, v9 = v4.useState(v1);
        local function v12(_, v11)
            if v11 ~= v8.voiceState then
                v9({
                    voiceEnabled = v11 ~= Enum.VoiceChatState.Ended, 
                    voiceState = v11
                });
            end;
        end;
        v4.useEffect(function()
            local v13 = true;
            local v14 = nil;
            if game:GetEngineFeature("VoiceChatSupported") then
                l_default_0:asyncInit():andThen(function()
                    if v13 then
                        l_default_0:SetupParticipantListeners();
                        local v15 = l_default_0:getService();
                        if v15 then
                            local l_VoiceChatState_0 = v15.VoiceChatState;
                            if l_VoiceChatState_0 ~= v8.voiceState then
                                v9({
                                    voiceEnabled = l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended, 
                                    voiceState = l_VoiceChatState_0
                                });
                            end;
                            v14 = v15.StateChanged:Connect(v12);
                        end;
                    end;
                end):catch(function()
                    local l_v0_0 = v0;
                    if l_v0_0 ~= v8.voiceState then
                        v9({
                            voiceEnabled = l_v0_0 ~= Enum.VoiceChatState.Ended, 
                            voiceState = l_v0_0
                        });
                    end;
                end);
            end;
            return function()
                v13 = false;
                if v14 then
                    v14:Disconnect();
                    v14 = nil;
                end;
            end;
        end, {});
        return v4.createElement(v6.Provider, {
            value = v8
        }, v7.children);
    end, 
    Consumer = v6.Consumer, 
    Context = v6, 
    withVoiceState = function(v18)
        return v4.createElement(v6.Consumer, {
            render = v18
        });
    end
};
