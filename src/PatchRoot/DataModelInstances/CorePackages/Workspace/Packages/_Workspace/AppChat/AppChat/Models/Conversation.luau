local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_MockId_0 = require(l_Parent_0.UnitTestHelpers).MockId;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_Players_0 = game:GetService("Players");
local function v8(v7)
    return v7.id;
end;
local function v11(v9, v10)
    return v9.sent:GetUnixTimestamp() < v10.sent:GetUnixTimestamp();
end;
local function v14(v12, v13)
    return v12.order < v13.order;
end;
local v15 = {
    Type = {
        MULTI_USER_CONVERSATION = "MultiUserConversation", 
        ONE_TO_ONE_CONVERSATION = "OneToOneConversation"
    }
};
v15.IdForFakeOneOnOne = function(v16)
    local l_ONE_TO_ONE_CONVERSATION_0 = v15.Type.ONE_TO_ONE_CONVERSATION;
    table.sort(v16);
    for _, v19 in ipairs(v16) do
        l_ONE_TO_ONE_CONVERSATION_0 = l_ONE_TO_ONE_CONVERSATION_0 .. "-" .. tostring(v19);
    end;
    return l_ONE_TO_ONE_CONVERSATION_0;
end;
v15.new = function()
    return {};
end;
v15.fromUser = function(v20)
    local v21 = v15.new();
    v21.messages = l_OrderedMap_0.new(v8, v11);
    v21.sendingMessages = l_OrderedMap_0.new(v8, v14);
    v21.clientId = l_MockId_0();
    v21.initiator = nil;
    v21.hasUnreadMessages = false;
    v21.conversationType = v15.Type.ONE_TO_ONE_CONVERSATION;
    v21.participants = {
        tostring(l_Players_0.LocalPlayer.UserId), 
        v20.id
    };
    v21.usersTyping = {};
    v21.isUserLeaving = false;
    v21.fetchingOlderMessages = false;
    v21.fetchedOldestMessage = false;
    v21.serverState = v4.ServerState.NONE;
    v21.id = v15.IdForFakeOneOnOne(v21.participants);
    v21.lastUpdated = nil;
    v21.isDefaultTitle = true;
    v21.title = v20.displayName or v20.name;
    return v21;
end;
v15.empty = function(v22)
    local v23 = v15.new();
    v23.id = "-1";
    v23.messages = l_OrderedMap_0.new(v8, v11);
    v23.sendingMessages = l_OrderedMap_0.new(v8, v14);
    v23.title = "";
    v23.initiator = "0";
    v23.hasUnreadMessages = false;
    v23.conversationType = v15.Type.MULTI_USER_CONVERSATION;
    v23.participants = {};
    v23.usersTyping = {};
    v23.isUserLeaving = false;
    v23.fetchingOlderMessages = false;
    v23.serverState = v4.ServerState.NONE;
    v23.pinnedGame = {};
    v23.lastUpdated = l_DateTime_0.now();
    v23.isDefaultTitle = true;
    if v22 ~= nil then
        for v24, v25 in pairs(v22) do
            v23[v24] = v25;
        end;
    end;
    return v23;
end;
v15.fromWeb = function(v26, v27)
    local v28 = v15.new();
    v28.messages = l_OrderedMap_0.new(v8, v11);
    v28.sendingMessages = l_OrderedMap_0.new(v8, v14);
    v28.id = tostring(v26.id);
    v28.clientId = v27 or l_MockId_0();
    v28.title = v26.title;
    v28.initiator = tostring(v26.initiator.targetId);
    v28.hasUnreadMessages = v26.hasUnreadMessages;
    v28.conversationType = v26.conversationType;
    v28.participants = {};
    v28.usersTyping = {};
    v28.isUserLeaving = false;
    v28.fetchingOlderMessages = false;
    v28.serverState = v4.ServerState.CREATED;
    v28.pinnedGame = {};
    if v26.conversationUniverse ~= nil then
        v28.pinnedGame.universeId = tostring(v26.conversationUniverse.universeId);
        v28.pinnedGame.rootPlaceId = tostring(v26.conversationUniverse.rootPlaceId);
    end;
    v28.lastUpdated = l_DateTime_0.fromIsoDate(v26.lastUpdated);
    v28.titleForViewer = v26.conversationTitle.titleForViewer;
    v28.isDefaultTitle = v26.conversationTitle.isDefaultTitle;
    for _, v30 in ipairs(v26.participants) do
        table.insert(v28.participants, (tostring(v30.targetId)));
    end;
    return v28;
end;
return v15;
