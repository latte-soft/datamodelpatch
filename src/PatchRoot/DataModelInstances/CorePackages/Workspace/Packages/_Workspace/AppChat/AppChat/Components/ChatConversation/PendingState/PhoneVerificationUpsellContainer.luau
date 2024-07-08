local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useState_0 = v5.useState;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v16 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v17 = require(script.Parent.PendingStateModal);
local v18 = {
    conversationId = nil, 
    showNetworkErrorToast = function()
    end, 
    onHeightChanged = function()
    end, 
    bodyKey = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
    acceptKey = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
    denyKey = "Feature.Chat.Action.Leave"
};
PhoneVerificationUpsellContainer = function(v19)
    local v20 = v4.Dictionary.join(v18, v19);
    local v21, v22 = l_useState_0(false);
    local v23 = l_useLocalUserId_0();
    local v24 = l_useDispatch_0();
    local v27 = l_useCallback_0(function(v25, v26)
        return v24(v3.rodux.RemoveUserFromConversation.API(v26, v25));
    end, l_dependencyArray_0(v24));
    local v30 = l_useCallback_0(function()
        v22(true);
        v24(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v16, 
                completionCallback = function(v28, _)
                    v24(l_NavigateBack_0(true));
                    if v28 ~= l_AccessResponseEnum_0.Granted then
                        v22(false);
                    end;
                end
            }
        }));
    end, l_dependencyArray_0(v24, v22));
    local v31 = l_useCallback_0(function()
        v22(true);
        v27(v23, v20.conversationId):catch(function()
            v20.showNetworkErrorToast();
        end):finally(function()
            v22(false);
        end);
    end, l_dependencyArray_0(v23, v20.conversationId));
    local v32 = {
        bodyText = "This is an upgraded conversation, which allows members to chat openly without filters. Add your phone number to gain access to upgraded conversations.", 
        acceptText = "Continue", 
        denyText = "Leave group"
    };
    return v5.createElement(v17, {
        bodyText = v32.bodyText, 
        acceptText = v32.acceptText, 
        denyText = v32.denyText, 
        layoutOrder = v20.layoutOrder, 
        onAccepted = v30, 
        onDenied = v31, 
        loading = v21, 
        onHeightChanged = v20.onHeightChanged
    });
end;
return l_memo_0(PhoneVerificationUpsellContainer);
