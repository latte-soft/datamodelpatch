local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(script:FindFirstAncestor("ShareTargetGame").dependencies);
local l_compose_0 = v7.SocialLibraries.RoduxTools.compose;
local l_UniversalAppPolicy_0 = v7.UniversalAppPolicy;
local v10 = require(script.Parent.ShareTargetGame);
local v11 = require(script.Parent.ShareTargetGameTopBar);
local v12 = v3.PureComponent:extend("ShareTargetGameContainer");
local v13 = require(script.Parent.Parent.mapStateToProps);
local v14 = require(script.Parent.Parent.mapDispatchToProps);
local v15 = require(script.Parent.Parent.Utils.keepConversationOrderSame);
v12.defaultProps = {
    analytics = nil, 
    networkImpl = nil
};
v12.init = function(v16)
    v16.hasAllInformation = function()
        if ((not v16.props.appLoaded or not v16.props.placeInfo) or not v16.props.gameCreator) or not v16.props.gameThumbnail then
            return false;
        else
            return true;
        end;
    end;
    v16.state = {
        conversationSendingStatuses = {}
    };
end;
v12.getDerivedStateFromProps = function(v17, v18)
    return {
        formattedConversations = v15(v17.conversations, v18.formattedConversations)
    };
end;
getChatRecipient = function(v19, v20)
    for _, v22 in v19, nil, nil do
        if v22 ~= v20 then
            return v22;
        end;
    end;
    return nil;
end;
v12.render = function(v23)
    return v4.Style.withStyle(function(v24)
        local function v27(v25)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                shareTargetGame = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0
                }, {
                    layout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    topBar = v3.createElement(v11, {
                        LayoutOrder = 1
                    }), 
                    content = v3.createElement(v10, v2.Dictionary.join(v23.props, v25, {
                        onSendButtonActivated = function(v26)
                            v23:setState({
                                conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                                    [v26.conversationId] = "sending"
                                })
                            });
                            return v23.props.sendGameLinkToConversation(v26.conversationId, tostring(v23.props.placeInfo.universeId), true, if not game:DefineFastFlag("ExperienceInviteNotification", false) then nil else getChatRecipient(v26.participants, v23.props.senderId), v23.props.placeInfo.universeRootPlaceId):andThen(function()
                                v23.props.analytics:onActivatedInviteSent(tostring(v23.props.placeInfo.universeRootPlaceId), tostring(v23.props.placeInfo.universeId), tostring(v23.props.senderId), v26.conversationId, v26.participants);
                                v23:setState({
                                    conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                                        [v26.conversationId] = "sent"
                                    })
                                });
                            end, function()
                                v23:setState({
                                    conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                                        [v26.conversationId] = "failed"
                                    })
                                });
                            end);
                        end, 
                        formattedConversations = v23.state.formattedConversations, 
                        conversationSendingStatuses = v23.state.conversationSendingStatuses, 
                        LayoutOrder = 2, 
                        isLoading = not v23.hasAllInformation()
                    }))
                })
            });
        end;
        return v6({
            byBuilderText = {
                "Feature.Chat.Label.ByBuilder"; 
                USERNAME = v23.props.gameCreator
            }, 
            filterBoxPlaceHolderText = "Feature.Chat.Label.SearchForFriendsAndChat", 
            sentText = "Feature.Chat.Label.Sent", 
            sendText = "Feature.Chat.Action.Send", 
            sendingText = "Feature.Chat.Response.Sending", 
            failedText = "Feature.Chat.Response.Failed", 
            offlinePresence = "Common.Presence.Label.Offline", 
            onlinePresence = "Common.Presence.Label.Online"
        })(function(v28)
            return v27(v28);
        end);
    end);
end;
v12.didMount = function(v29)
    if v29.props.placeInfo.universeId then
        v29.props.fetchGameData(v29.props.networkImpl, v29.props.placeInfo.universeId);
    else
        v29.props.fetchPlaceInfos(v29.props.networkImpl, v29.props.placeId);
    end;
    if not v29.props.appLoaded then
        spawn(function()
            v29.props.fetchConversations(1):andThen(function()
                v29.props.setAppLoaded();
            end);
        end);
    end;
    v29.props.analytics:inputShareGameEntryPoint(v29.props.placeId, v29.props.placeInfo.universeId);
end;
return l_compose_0(v5.connect(v13, v14), l_UniversalAppPolicy_0.connect(function(v30)
    return {
        shouldShowCreatorName = v30.shouldShowCreatorName()
    };
end))(v12);
