local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.State.Actions;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.FriendsMenu);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local l_InviteFriendContext_0 = v4.InviteFriendContext;
local l_InviteStatus_0 = v4.InviteStatus;
local v9 = require(l_Parent_0.GameInviteDependencies);
local v10 = require(l_Parent_0.analytics.GameInviteAnalyticsManager);
local l_Throttle_0 = require(l_Parent_1.NotificationsCommon).Throttle;
local v12 = require(l_Actions_0.ReceivedUserInviteStatus);
local l_networkImpl_0 = v9.networkImpl;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local v15 = require(l_Parent_0.Requests.PostSendExperienceInvite);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v17 = require(l_Parent_1.SharedFlags);
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = v17.GetFFlagEnableUniversalAppGameInviteUnification;
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = v17.GetFFlagFriendsMenuDummyLoadingFriendsFix;
return function(v20)
    local v21 = l_useDispatch_0();
    local v22 = v5.useRef(0);
    local v24 = l_useSelector_0(function(v23)
        if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            return v23.Invites;
        else
            return v23.GameInvitesStatus;
        end;
    end);
    return v5.createElement(l_InviteFriendContext_0.Provider, {
        value = {
            inviteSingleFriend = l_Throttle_0(function(v25, v26)
                v22.current = math.max(v26, v22.current);
                if l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and ((not (v25 and v25 ~= "") or not tonumber(v25)) or tonumber(v25) == 0) then
                    return ;
                elseif v24[v25] and (not (v24[v25] == l_InviteStatus_0.Failed) or v24[v25] == l_InviteStatus_0.Pending) then
                    return ;
                else
                    local v27 = nil;
                    v27 = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then tostring(game.PlaceId) else if v20.isCoreScript then tostring(game.PlaceId) else v20.rootPlaceId or tostring(game.PlaceId);
                    if v27 == "0" then
                        warn("Game Invite failed to send. Cannot send invite to unpublished Place.");
                        v21(v12(v25, l_InviteStatus_0.Failed));
                        return ;
                    else
                        local v28 = false;
                        if v20.launchData ~= nil then
                            v28 = v20.launchData ~= "";
                        end;
                        local v29 = false;
                        if v20.promptMessage ~= nil then
                            v29 = v20.promptMessage ~= "";
                        end;
                        local v30 = false;
                        if v20.inviteMessageId ~= nil then
                            v30 = v20.inviteMessageId ~= "";
                        end;
                        v10:sendGameInviteModalEvent(v20.trigger, {
                            action_type = v10.ActionType.InviteTriggered, 
                            is_launch_data_provided = v28, 
                            is_prompt_customized = v29, 
                            is_invite_message_id_provided = v30, 
                            recipient_user_id = v25, 
                            recipient_row_number = v26
                        });
                        v21(v12(v25, l_InviteStatus_0.Pending));
                        v15(l_networkImpl_0, v25, v27, v20.trigger, v20.inviteMessageId, v20.launchData):andThen(function(v31)
                            v10:onActivatedInviteSent(l_Players_0.LocalPlayer.UserId, v31.conversationId, {
                                v25
                            }, v20.rootPlaceId, v20.universeId);
                            v21(v12(v25, l_InviteStatus_0.Success));
                        end, function()
                            v10:sendGameInviteModalEvent(v20.trigger, {
                                action_type = v10.ActionType.InviteFailure, 
                                is_launch_data_provided = v28, 
                                is_prompt_customized = v29, 
                                is_invite_message_id_provided = v30, 
                                recipient_user_id = v25, 
                                recipient_row_number = v26
                            });
                            v21(v12(v25, l_InviteStatus_0.Failed));
                        end);
                        return ;
                    end;
                end;
            end), 
            getMaxRecipientRowNum = function()
                return v22.current;
            end
        }
    }, v20.children);
end;
