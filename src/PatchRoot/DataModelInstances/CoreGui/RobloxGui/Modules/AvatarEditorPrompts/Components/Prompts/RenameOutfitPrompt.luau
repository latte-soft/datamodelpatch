local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v11 = require(l_Parent_0.Prompts.PromptWithTextField);
local v12 = require(l_Parent_1.Thunks.SignalRenameOutfitPermissionDenied);
local v13 = require(l_Parent_1.Thunks.PerformRenameOutfit);
local v14 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v15 = v2.PureComponent:extend("RenameOutfitNamePrompt");
v15.validateProps = v4.strictInterface({
    outfitId = v4.integer, 
    outfitName = v4.string, 
    screenSize = v4.Vector2, 
    signalRenameOutfitPermissionDenied = v4.callback, 
    performRenameOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v15.init = function(v16)
    v16:setState({
        outfitName = "", 
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v16.textUpdated = function(v17)
        v16:setState({
            outfitName = v17
        });
    end;
    v16.confirmRenameOutfit = function()
        v16.props.performRenameOutfit(v16.state.outfitName);
    end;
end;
v15.render = function(v18)
    if v18.props.showCustomOutfitNames then
        return v2.createElement(v11, {
            fieldText = v18.state.outfitName, 
            onFieldTextUpdated = v18.textUpdated, 
            title = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"), 
            bodyText = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", {
                RBX_NAME = v18.props.outfitName
            }), 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v18.props.signalRenameOutfitPermissionDenied, 
                            text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v18.state.outfitName == "", 
                            onActivated = v18.confirmRenameOutfit, 
                            text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            title = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptTitle"), 
            bodyText = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptText"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v18.props.signalRenameOutfitPermissionDenied, 
                            text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
                        }, 
                        isDefaultChild = true
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v18.props.screenSize, 
            isMiddleContentFocusable = false
        });
    end;
end;
return (v14.connect(function(v19, _)
    return {
        showCustomOutfitNames = v19.getCustomOutfitNames()
    };
end)((v3.connect(function(v21)
    return {
        outfitId = v21.promptInfo.outfitId, 
        outfitName = v21.promptInfo.outfitName, 
        screenSize = v21.screenSize
    };
end, function(v22)
    return {
        signalRenameOutfitPermissionDenied = function()
            return v22(v12);
        end, 
        performRenameOutfit = function(v23)
            return v22(v13(v23));
        end
    };
end)(v15))));
