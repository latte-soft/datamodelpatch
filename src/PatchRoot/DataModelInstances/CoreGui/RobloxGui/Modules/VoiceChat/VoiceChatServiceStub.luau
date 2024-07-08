local l_waitForEvents_0 = require(game:GetService("CorePackages").Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents;
local function v1()
end;
local function _(v2)
    return function()
        return v2;
    end;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local v7 = {
    ParticipantsStateChanged = l_BindableEvent_0.Event, 
    StateChanged = l_BindableEvent_2.Event, 
    LocalPlayerModerated = l_BindableEvent_1.Event
};
local v8 = 0;
v7.GetVoiceChatApiVersionCB = function()
    return v8;
end;
v7.GetVoiceChatAvailableCB = v1;
v7.IsSubscribePausedCB = v1;
v7.SubscribePauseCB = v1;
v7.SubscribeBlockCB = v1;
v7.SubscribeUnblockCB = v1;
v7.SubscribePauseAllCB = v1;
v7.groupId = 10000;
v7.publishPaused = false;
v7.available = true;
v7.joinCalled = false;
v7.policyMapper = nil;
local function v11(v9, v10)
    return {
        userId = tostring(v9), 
        UserId = tostring(v9), 
        isMuted = false, 
        isMutedLocally = not not v10
    };
end;
v7.Disconnect = function(_)
end;
v7.Leave = function(_)
end;
v7.GetGroupId = function(v14)
    return v14.groupId;
end;
v7.IsPublishPaused = function(v15)
    return v15.publishPaused;
end;
v7.JoinByGroupIdToken = function(v16)
    v16.joinCalled = true;
    return true;
end;
v7.IsSubscribePaused = function(v17)
    return v17.IsSubscribePausedCB();
end;
v7.SubscribePause = function(v18, v19)
    return v18.SubscribePauseCB(v19);
end;
v7.GetVoiceChatApiVersion = function(v20)
    return v20.GetVoiceChatApiVersionCB();
end;
v7.GetVoiceChatAvailable = function(v21)
    return v21.GetVoiceChatAvailableCB();
end;
v7.SubscribeBlock = function(v22)
    return v22.SubscribeBlockCB();
end;
v7.SubscribePauseAll = function(v23)
    return v23.SubscribePauseAllCB();
end;
v7.SubscribeUnblock = function(v24)
    return v24.SubscribeUnblockCB();
end;
v7.kickUsers = function(_, v26)
    l_BindableEvent_0:Fire(v26, {}, {});
    l_waitForEvents_0();
end;
v7.ModerateLocalPlayer = function(_)
    l_BindableEvent_1:Fire();
    l_waitForEvents_0();
end;
v7.addUsers = function(_, v29)
    l_BindableEvent_0:Fire({}, {}, v29);
    l_waitForEvents_0();
end;
v7.setUserStates = function(_, v31)
    l_BindableEvent_0:Fire({}, {}, v31);
    l_waitForEvents_0();
end;
v7.resetMocks = function(v32)
    l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_2 = Instance.new("BindableEvent");
    l_BindableEvent_1 = Instance.new("BindableEvent");
    v32.LocalPlayerModerated = l_BindableEvent_1.Event;
    v32.ParticipantsStateChanged = l_BindableEvent_0.Event;
    v32.StateChanged = l_BindableEvent_2.Event;
    v32.joinCalled = false;
end;
return {
    ParticipantsStateChangedMock = l_BindableEvent_0, 
    StateChangedMock = l_BindableEvent_2, 
    VoiceChatServiceStub = v7, 
    makeMockUser = v11
};
