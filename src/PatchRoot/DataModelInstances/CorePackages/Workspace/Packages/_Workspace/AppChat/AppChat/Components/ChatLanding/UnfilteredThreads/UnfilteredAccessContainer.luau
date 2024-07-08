local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local v10 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useContext_0 = v4.useContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local v15 = require(l_Parent_0.AppChatNetworking);
local v16 = require(script.Parent.UnfilteredThreadsFtux);
local v17 = {
    dismissUpsell = function()
    end, 
    titleKey = "Feature.Chat.Action.Hello", 
    bodyKey = "Feature.Chat.Action.Hello", 
    actionKey = "Feature.Chat.Label.SeeMore"
};
return l_memo_0(function(v18)
    local v19 = v3.Dictionary.join(v17, v18);
    local v20 = l_useContext_0(v5);
    local v21 = l_useDispatch_0();
    local v22 = v10();
    local v23 = l_useRef_0(false);
    l_useEffect_0(function()
        if not v23.current and v22 then
            v21(v15.rodux.RecordUnfilteredThreadsModalAction.API("record_has_seen", "fully_eligible_ftux")):andThen(function(v24)
                if v24 and v24.responseCode == l_StatusCodes_0.OK then
                    v23.current = true;
                end;
            end):catch(function(v25)
                warn("Error in UnfilteredAccessContainer -> RecordUnfilteredThreadsModalAction record_has_seen: " .. tostring(v25));
            end);
            return ;
        else
            return ;
        end;
    end, l_dependencyArray_0(v21, v22, v23.current));
    local v26 = l_useCallback_0(function()
        v20.navigateToUnfilteredThreadsLearnMore();
    end, l_dependencyArray_0(v20));
    local v28 = l_useCallback_0(function()
        v21(v15.rodux.RecordUnfilteredThreadsModalAction.API("record_dont_show_again", "fully_eligible_ftux")):catch(function(v27)
            warn("Error in UnfilteredAccessContainer -> RecordUnfilteredThreadsModalAction record_dont_show_again: " .. tostring(v27));
        end);
        v19.dismissUpsell();
    end, l_dependencyArray_0(v19.dismissUpsell, v21));
    local v29 = {
        titleText = "New: Upgraded Conversations", 
        bodyText = "You now have access to upgraded conversations, which allow you to chat openly without filters. Please respect the community guidelines and avoid sharing sensitive information.", 
        actionText = "Learn more"
    };
    return v4.createElement(v16, {
        titleText = v29.titleText, 
        bodyText = v29.bodyText, 
        actionText = v29.actionText, 
        onActivated = v26, 
        onDismissed = v28
    });
end);
