local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local l_ResponseIndicator_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.ResponseIndicator;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local v8 = require(l_Parent_0.Promise);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v14 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v15 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v18 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer);
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v21 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local v22 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v25 = {
    systemButtonText = "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = "Feature.Chat.Heading.ChatWithFriends", 
    topBarHeight = nil, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    conversation = v15.empty(), 
    setSystemButtonActivated = function(_)
    end, 
    setSystemButtonEnabled = function(_)
    end
};
CreateNewChatContainer = function(v26)
    local v27 = v4.Dictionary.join(v25, v26);
    local v28 = l_useRef_0({});
    local v29 = l_useRef_0(false);
    local v30, v31 = l_useState_0(false);
    local v32 = l_useDispatch_0();
    local v34 = l_useCallback_0(function(v33)
        return v32(v14.StartOneToOneConversation.API(v33));
    end, l_dependencyArray_0(v32));
    local v37 = l_useCallback_0(function(v35, v36)
        return v32(v14.StartGroupConversation.API(v35, v36));
    end, l_dependencyArray_0(v32));
    local v39 = l_useCallback_0(function(v38)
        v27.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v38
                }
            }
        });
    end, l_dependencyArray_0(v27.navigateToToast));
    local function v44(v40, v41)
        v28.current = v4.List.map(v40, function(v42)
            return v42.id;
        end);
        local v43 = v41 <= #v40;
        if v29.current ~= v43 then
            v29.current = v43;
            v27.setSystemButtonEnabled(v43);
        end;
    end;
    local v45 = v20();
    local function v54(v46)
        if not v22() then
            local v47 = nil;
            v47 = if not not v28.current and #v28.current == 1 then v34(v28.current[1]) else v37(v28.current, nil);
            v31(true);
            return v47:andThen(function(v48)
                local v49 = nil;
                local v50 = nil;
                if v45 then
                    if v48 then
                        if v48.responseBody then
                            if v48.responseBody.conversation then
                                if v48.responseBody.resultType then
                                    v49 = v48.responseBody.resultType;
                                    v50 = v48.responseBody.conversation.id;
                                else
                                    v49 = v21.DEPRECATED_NoResultType;
                                    v50 = v48.responseBody.conversation.id;
                                end;
                            else
                                v49 = v21.DEPRECATED_NoConversation;
                            end;
                        else
                            v49 = v21.DEPRECATED_NoResponseBody;
                        end;
                    else
                        v49 = v21.DEPRECATED_NoResponse;
                    end;
                end;
                local v51 = v15.fromWeb(v48.responseBody.conversation);
                v27.navigateToConversation(v51.id);
                if v45 then
                    v45.fireAnalyticsEvent(v19.NewConversationCreated, {
                        conversationId = v50, 
                        createConversationResult = v49, 
                        participantsCount = #v51.participants
                    });
                end;
            end):catch(function()
                v39(v46.networkErrorText);
                v31(false);
                if v45 then
                    v45.fireAnalyticsEvent(v19.NewConversationCreated, {
                        createConversationResult = v21.FetchConversationError
                    });
                end;
            end);
        elseif v28.current then
            v31(true);
            return v32(v17(#v28.current == 1 and "one_to_one" or "group", v28.current, v45, "userCreatedNewConversation")):andThen(function(v52)
                v27.navigateToConversation(v52.id);
            end):catch(function(_)
                v39(v46.networkErrorText);
                v31(false);
                if v45 then
                    v45.fireAnalyticsEvent(v19.NewConversationCreated, {
                        createConversationResult = v21.FetchConversationError
                    });
                end;
            end);
        else
            return v8.resolve();
        end;
    end;
    l_useEffect_0(function()
        v27.setSystemButtonActivated(v54);
    end, {});
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        responseIndicator = v30 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v18, v4.Dictionary.join(v27, {
            selectedUsersChanged = v44
        }))
    });
end;
return l_memo_0(CreateNewChatContainer);
