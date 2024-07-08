local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.UIBlox);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v7 = v3.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local v13 = require(script.Parent.Parent.Thunks.CloseResultModal);
local v14 = require(script.Parent.Parent.GetFFlagValidateDescription);
local v15 = v8.PureComponent:extend("ResultModal");
v15.validateProps = v10.strictInterface({
    screenSize = v10.Vector2, 
    resultModalType = v10.enum(Enum.PromptPublishAssetResult), 
    closeResultModal = v10.callback
});
local function _(v16)
    return l_getInputGroup_0(v16) == v11.InputTypeConstants.Gamepad;
end;
v15.init = function(v18)
    v18:setState({
        isGamepad = l_getInputGroup_0((l_UserInputService_0:GetLastInputType())) == v11.InputTypeConstants.Gamepad
    });
end;
v15.getLocalizedStringForResultPrompt = function(_, v20)
    if v20 == Enum.PromptPublishAssetResult.Success then
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage");
    elseif v20 == Enum.PromptPublishAssetResult.UploadFailed then
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed");
    elseif v20 == Enum.PromptPublishAssetResult.NoUserInput then
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput");
    else
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", {
            RESULT_TYPE = tostring(v20)
        });
    end;
end;
v15.getLocalizedTitleForResultPrompt = function(_, v22)
    if v22 == Enum.PromptPublishAssetResult.Success then
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle");
    else
        return v6:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle");
    end;
end;
v15.render = function(v23)
    return v8.createElement(l_InteractiveAlert_0, {
        title = v23:getLocalizedTitleForResultPrompt(v23.props.resultModalType), 
        bodyText = v23:getLocalizedStringForResultPrompt(v23.props.resultModalType), 
        screenSize = v23.props.screenSize, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v23.props.closeResultModal, 
                        text = if not v14() then v6:FormatByKey("InGame.CommonUI.Button.Ok") else v6:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                        inputIcon = not not v23.state.isGamepad and v7 or nil
                    }
                }
            }
        }
    });
end;
return v9.connect(function(v24)
    return {
        resultModalType = v24.promptRequest.resultModalType
    };
end, function(v25)
    return {
        closeResultModal = function()
            return v25(v13);
        end
    };
end)(v15);
