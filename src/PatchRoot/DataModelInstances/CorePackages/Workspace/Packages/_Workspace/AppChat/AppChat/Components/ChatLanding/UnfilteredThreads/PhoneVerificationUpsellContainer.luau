local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local v9 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local v13 = require(l_Parent_0.AppChatNetworking);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v17 = require(l_script_FirstAncestor_0.Components.UnfilteredThreadsAMPFeatureName);
local v18 = require(script.Parent.UnfilteredThreadsFtux);
local v19 = {
    dismissUpsell = function()
    end, 
    titleKey = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
    bodyKey = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
    actionKey = "Amp.AccountSettingsUpsell.Phone.Modal.Title"
};
return l_memo_0(function(v20)
    local v21 = v3.Dictionary.join(v19, v20);
    local v22 = l_useDispatch_0();
    local v23 = v9();
    local v24 = l_useRef_0(false);
    l_useEffect_0(function()
        if not v24.current and v23 then
            v22(v13.rodux.RecordUnfilteredThreadsModalAction.API("record_has_seen", "phone_verify")):andThen(function(v25)
                if v25 and v25.responseCode == l_StatusCodes_0.OK then
                    v24.current = true;
                end;
            end):catch(function(v26)
                warn("Error in PhoneVerificationUpsellContainer -> RecordUnfilteredThreadsModalAction record_has_seen: " .. tostring(v26));
            end);
            return ;
        else
            return ;
        end;
    end, l_dependencyArray_0(v22, v23, v24.current));
    local v29 = l_useCallback_0(function()
        v22(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v17, 
                completionCallback = function(_, _)
                    v22(l_NavigateBack_0(true));
                end
            }
        }));
    end, l_dependencyArray_0(v22));
    local v31 = l_useCallback_0(function()
        v22(v13.rodux.RecordUnfilteredThreadsModalAction.API("record_dont_show_again", "phone_verify")):catch(function(v30)
            warn("Error in PhoneVerificationUpsellContainer -> RecordUnfilteredThreadsModalAction record_dont_show_again: " .. tostring(v30));
        end);
        v21.dismissUpsell();
    end, l_dependencyArray_0(v21.dismissUpsell, v22));
    local v32 = {
        titleText = "Upgrade your chats with friends", 
        bodyText = "Chat openly without filters and unlock other exciting communication features by adding your phone number.", 
        actionText = "Add phone to get started"
    };
    return v4.createElement(v18, {
        titleText = v32.titleText, 
        bodyText = v32.bodyText, 
        actionText = v32.actionText, 
        onActivated = v29, 
        onDismissed = v31
    });
end);
