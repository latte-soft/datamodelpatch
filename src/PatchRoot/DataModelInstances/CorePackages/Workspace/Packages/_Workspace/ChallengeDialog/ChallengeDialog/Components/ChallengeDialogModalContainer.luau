local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v9 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogAlreadyCompleted);
local v10 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogApproval);
local v11 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogDenied);
local v12 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogExpired);
local v13 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogPollingIntervalSeconds);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v16 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal
});
local v17 = {
    [v7.ChallengeDialogApproval] = v10, 
    [v7.ChallengeDialogDenied] = v11, 
    [v7.ChallengeDialogExpired] = v12, 
    [v7.ChallengeDialogAlreadyCompleted] = v9
};
return v3.connect(function(_, _)
    return {};
end, function(v20)
    return {
        navigateBack = function()
            return v20(l_NavigateBack_0());
        end, 
        fetchDialog = function(v21)
            return v20(v13(v21));
        end
    };
end)(function(v22)
    local v23, v24 = v2.useState(v22);
    v2.useEffect(function()
        if not (v23.modalState ~= v7.ChallengeDialogApproval) or v23.modalState == v7.ChallengeDialogExpired then
            v15.sendDialogOpenedEvent(v8.toRawValue(v8.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v22.dialogItem.typeInternalId, v22.dialogItem.isExpired);
        end;
    end, {
        v23
    });
    v2.useEffect(function()
        local v28 = task.spawn(function()
            while not (v23.modalState ~= v7.ChallengeDialogApproval) or v23.modalState == v7.ChallengeDialogExpired do
                v22.fetchDialog(v16):andThen(function(v25)
                    local v26 = v25.dialogs[1];
                    if v26 ~= nil then
                        if not (not (v23.modalState == v7.ChallengeDialogApproval) or not v26.isExpired) then
                            v24({
                                modalState = v7.ChallengeDialogExpired, 
                                dialogItem = v26
                            });
                            return ;
                        end;
                    else
                        v22.navigateBack();
                    end;
                end):catch(function(_)
                end):await();
                task.wait((v14()));
            end;
        end);
        return function()
            task.cancel(v28);
        end;
    end, {
        v23.modalState
    });
    local function v32()
        v22.fetchDialog(v16):andThen(function(v29)
            local v30 = v29.dialogs[1];
            if v30 ~= nil then
                v24({
                    modalState = not not v30.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval, 
                    dialogItem = v30
                });
                return ;
            else
                v22.navigateBack();
                return ;
            end;
        end):catch(function(_)
            v22.navigateBack();
        end):await();
    end;
    local v33 = v17[v23.modalState];
    return v33 and v2.createElement(v33, v4.Dictionary.join(v23, {
        navigateToModalState = v24, 
        closeModal = v32
    }));
end);
