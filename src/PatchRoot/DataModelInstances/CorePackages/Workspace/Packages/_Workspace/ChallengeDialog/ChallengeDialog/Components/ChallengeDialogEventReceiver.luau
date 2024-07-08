local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.HttpRequest);
local l_NavigateSideways_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateSideways;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSeconds);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryTimes);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppChallengeDialogFetchDialogConditionally);
local v12 = v4.config({
    requestFunction = v4.requestFunctions.RequestInternal
});
return v3.connect(function(_, _)
    return {};
end, function(v15)
    return {
        navigateToPage = function(v16, v17)
            return v15(l_NavigateSideways_0(v16, v17));
        end, 
        fetchDialog = function(v18)
            return v15(v8(v18));
        end
    };
end)(function(v19)
    local l_RobloxEventReceiver_0 = v19.RobloxEventReceiver;
    local v21 = 0;
    local v22 = false;
    local function v26()
        v19.fetchDialog(v12):andThen(function(v23)
            local v24 = v23.dialogs[1];
            if v24 ~= nil then
                v19.navigateToPage({
                    name = l_AppPage_0.ChallengeDialogModalContainer, 
                    extraProps = {
                        modalState = not not v24.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval, 
                        dialogItem = v24
                    }
                });
            end;
        end):catch(function(_)
        end):await();
    end;
    v2.useEffect(function()
        local v35 = {
            l_RobloxEventReceiver_0:observeEvent("signalR", function(v27, _, v29)
                if v27 == Enum.ConnectionState.Connected then
                    if v11() then
                        if not (not v29 or not v29.ChallengeDialogNotification) then
                            if not (not (v21 ~= v29.ChallengeDialogNotification) or v22) then
                                v26();
                            end;
                            v21 = v29.ChallengeDialogNotification;
                        end;
                    else
                        v26();
                        return ;
                    end;
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("ChallengeDialogNotification", function(v30)
                v21 = v30.SequenceNumber;
                if not v22 then
                    v26();
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("AppInput", function(_, v32)
                if v32 == "Focused" then
                    v22 = false;
                    local v33 = v9();
                    for v34 = 1, v10() + 1 do
                        task.delay(v34 * v33, v26);
                    end;
                    return ;
                elseif v32 == "Unfocused" then
                    v22 = true;
                    return ;
                else
                    v22 = false;
                    return ;
                end;
            end)
        };
        return function()
            for _, v37 in pairs(v35) do
                v37:disconnect();
            end;
        end;
    end, {});
    return nil;
end);
