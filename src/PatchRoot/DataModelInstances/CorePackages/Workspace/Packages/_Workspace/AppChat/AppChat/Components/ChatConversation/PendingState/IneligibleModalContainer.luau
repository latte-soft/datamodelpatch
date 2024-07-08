local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useContext_0 = v5.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useState_0 = v5.useState;
local v14 = require(script.Parent.PendingStateModal);
local v15 = {
    conversationId = nil, 
    showNetworkErrorToast = function()
    end, 
    onHeightChanged = function()
    end, 
    bodyKey = "Feature.Chat.Action.Hello", 
    acceptKey = "Feature.Chat.Label.SeeMore", 
    denyKey = "Feature.Chat.Action.Leave"
};
IneligibleModalContainer = function(v16)
    local v17 = v4.Dictionary.join(v15, v16);
    local v18, v19 = l_useState_0(false);
    local v20 = l_useLocalUserId_0();
    local v21 = l_useContext_0(v6);
    local v22 = l_useDispatch_0();
    local v25 = l_useCallback_0(function(v23, v24)
        return v22(v3.rodux.RemoveUserFromConversation.API(v24, v23));
    end, l_dependencyArray_0(v22));
    local v26 = l_useCallback_0(function()
        v21.navigateToUnfilteredThreadsLearnMore();
    end, l_dependencyArray_0(v21));
    local v27 = l_useCallback_0(function()
        v19(true);
        v25(v20, v17.conversationId):catch(function()
            v17.showNetworkErrorToast();
        end):finally(function()
            v19(false);
        end);
    end, l_dependencyArray_0(v20, v17.conversationId));
    local v28 = {
        bodyText = "This is an upgraded conversation, which allows members to chat openly without filters. Your account is currently unable to join.", 
        acceptText = "Learn more", 
        denyText = "Leave group"
    };
    return v5.createElement(v14, {
        bodyText = v28.bodyText, 
        acceptText = v28.acceptText, 
        denyText = v28.denyText, 
        layoutOrder = v17.layoutOrder, 
        onAccepted = v26, 
        onDenied = v27, 
        loading = v18, 
        onHeightChanged = v17.onHeightChanged
    });
end;
return l_memo_0(IneligibleModalContainer);
