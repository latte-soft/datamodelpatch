local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_Network_0 = l_Parent_0.Network;
local v5 = require(l_Network_0.httpRequest);
local v6 = require(l_Network_0.Requests.DEPRECATED_ChatSendMessage);
local v7 = require(l_Network_0.Requests.DEPRECATED_ChatSendGameLinkMessage);
local v8 = require(l_Network_0.Requests.DEPRECATED_ChatStartOneToOneConversation);
local v9 = require(l_Network_0.Requests.GetPlaceInfos);
local v10 = v5(l_HttpRbxApiService_0);
local l_InviteStatus_0 = require(l_Parent_0.Resources.Constants).InviteStatus;
local v12 = require(l_Parent_0.Actions.ReceivedUserInviteStatus);
return function(v13, v14)
    return function(v15)
        if v15:getState().invites[tostring(v13)] == l_InviteStatus_0.Pending then
            return ;
        else
            v15:dispatch(v12(v13, l_InviteStatus_0.Pending));
            if not l_RunService_0:IsStudio() then
                return v9(v10, {
                    v14
                }):andThen(function(v16)
                    local v17 = v16.responseBody[1];
                    assert(v17, "Error fetching placeInfos");
                    v17.placeId = tostring(v17.placeId);
                    v17.universeId = tostring(v17.universeId);
                    return v17;
                end):andThen(function(v18)
                    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
                    local v20 = string.format("Come join me in %s", v18.name);
                    return v8(v10, v13, l_UserId_0):andThen(function(v21)
                        local l_conversation_0 = v21.responseBody.conversation;
                        return v6(v10, l_conversation_0.id, v20):andThen(function()
                            return v7(v10, l_conversation_0.id, v18.universeId):andThen(function(v23)
                                return {
                                    resultType = v23.responseBody.resultType, 
                                    conversationId = l_conversation_0.id, 
                                    placeId = v18.universeRootPlaceId
                                };
                            end);
                        end);
                    end);
                end):andThen(function(v24)
                    v15:dispatch(v12(v13, l_InviteStatus_0[v24.resultType] or l_InviteStatus_0.Failed));
                    return v24;
                end, function()
                    v15:dispatch(v12(v13, l_InviteStatus_0.Failed));
                end);
            else
                spawn(function()
                    v15:dispatch(v12(v13, l_InviteStatus_0.Failed));
                end);
                return ;
            end;
        end;
    end;
end;
