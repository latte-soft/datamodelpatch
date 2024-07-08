local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.Lock);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v12 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v13 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v14 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v15 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v16 = require(l_script_FirstAncestor_0.Thunks.FinishDialog);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v18 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v20 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal
});
local v21 = {
    okay = "Authentication.TwoStepVerification.Action.Okay", 
    header = "Authentication.TwoStepVerification.Header.LoginAttemptExpired", 
    loginExpired = "Authentication.TwoStepVerification.Label.LoginExpired", 
    helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
};
return v4.connect(function(_, _)
    return {};
end, function(v24)
    return {
        navigateToPage = function(v25)
            return v24(l_NavigateDown_0(v25));
        end, 
        finishDialog = function(v26, v27, v28)
            return v24(v16(v26, v27, v28));
        end
    };
end)(function(v29)
    local v30, v31 = v2.useState(false);
    local v32 = l_useLocalization_0(v21);
    local function v33()
        v31(true);
        v29.finishDialog(v20, {
            type = v29.dialogItem.type, 
            typeInternalId = v29.dialogItem.typeInternalId
        }, v14.Deny):await();
        v31(false);
        v29.closeModal();
    end;
    return v2.createElement(v9, {
        title = v32.header, 
        closeModal = function()
            v17.sendDialogAbandonedEvent(v15.toRawValue(v15.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v29.dialogItem.typeInternalId);
            v33();
        end, 
        makeBodyFragment = function(v34)
            return v2.createElement(v2.Fragment, nil, {
                Lock = v2.createElement(v10, {
                    layoutOrder = 1
                }), 
                ChangeYourPassword = v2.createElement(v11, {
                    layoutOrder = 2, 
                    contentWidth = v34, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v32.loginExpired
                })
            });
        end, 
        buttonConfig = v12({
            {
                isDisabled = v30, 
                isLoading = v30, 
                onActivated = v33, 
                text = v32.okay, 
                type = l_ButtonType_0.PrimarySystem
            }
        }), 
        footerContent = v13(function(v35)
            return v2.createElement(v11, {
                BackgroundTransparency = 0, 
                layoutOrder = 1, 
                text = v32.helpMessage, 
                contentWidth = v35, 
                size = v18.Footer, 
                onActivated = function()
                    v29.navigateToPage({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                        extraProps = {
                            title = ""
                        }
                    });
                end
            });
        end)
    });
end);
