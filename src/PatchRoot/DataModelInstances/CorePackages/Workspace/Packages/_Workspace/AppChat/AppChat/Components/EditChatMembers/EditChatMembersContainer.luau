local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v15 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v16 = require(l_Parent_0.AppChatNetworking);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v18 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v19 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_ResponseIndicator_0 = v3.Components.ResponseIndicator;
local v21 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer);
local v22 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v26 = {
    systemButtonText = "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = "Feature.Chat.Heading.ChatWithFriends", 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    topBarHeight = nil, 
    conversation = nil, 
    setSystemButtonActivated = function(_)
    end, 
    setSystemButtonEnabled = function(_)
    end
};
return l_memo_0(function(v27)
    local v28 = v4.Dictionary.join(v26, v27);
    local v29 = l_useRef_0({});
    local v30 = l_useRef_0(false);
    local v31, v32 = l_useState_0(false);
    local v33 = v19();
    local v35 = l_useSelector_0(l_useCallback_0(function(v34)
        return v34.LocalUserId;
    end, {}));
    local v36 = l_useDispatch_0();
    local v39 = l_useCallback_0(function(v37, v38)
        if not v18() then
            return v36(v15.AddToConversation.API(v37, v38));
        else
            return v36(v16.rodux.AddUserToConversation.API(v38, v37));
        end;
    end, l_dependencyArray_0(v36));
    local v41 = l_useCallback_0(function(v40)
        return v36(v17("group", v40, v33, "userAddedParticipantToOneToOne"));
    end, l_dependencyArray_0(v36));
    local v43 = l_useCallback_0(function(v42)
        return v36(v15.StartGroupConversation.API(v42));
    end, l_dependencyArray_0(v36));
    local v45 = l_useCallback_0(function(v44)
        v28.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v44
                }
            }
        });
    end, l_dependencyArray_0(v28.navigateToToast));
    local function v50(v46, v47)
        v29.current = v4.List.map(v46, function(v48)
            return v48.id;
        end);
        local v49 = v47 <= #v46;
        if v30.current ~= v49 then
            v30.current = v49;
            v28.setSystemButtonEnabled(v49);
        end;
    end;
    local function v59(v51)
        local l_id_0 = v28.conversation.id;
        local l_conversationType_0 = v28.conversation.conversationType;
        local function v54()
            v45(v51.networkErrorText);
            v32(false);
        end;
        v32(true);
        if l_conversationType_0 == v22.Type.MULTI_USER_CONVERSATION then
            return v39(v29.current, l_id_0):andThen(function()
                v28.navigateToConversation(l_id_0);
            end, v54);
        elseif l_conversationType_0 == v22.Type.ONE_TO_ONE_CONVERSATION then
            local v56 = v4.List.filter(v4.List.join(v29.current, v28.conversation.participants), function(v55)
                return v55 ~= v35;
            end);
            if not v18() then
                return v43(v56):andThen(function(v57)
                    v28.navigateToConversation(v22.fromWeb(v57.responseBody.conversation).id);
                end, v54);
            else
                return v41(v56):andThen(function(v58)
                    v28.navigateToConversation(v58.id);
                end, v54);
            end;
        else
            v45(v51.networkErrorText);
            v32(false);
            return v6.reject(string.format("conversationType not supported: %q", (tostring(l_conversationType_0))));
        end;
    end;
    l_useEffect_0(function()
        v28.setSystemButtonActivated(v59);
    end, {});
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        responseIndicator = v31 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v21, v4.Dictionary.join(v28, {
            maxSelections = (v28.maxSelections - #v28.conversation.participants) + 1, 
            selectedUsersChanged = v50, 
            localUserId = v35
        }))
    });
end);
