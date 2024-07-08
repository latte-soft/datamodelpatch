local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = require(l_CorePackages_0.UIBlox).App.Button.Enum.ButtonType;
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v9 = require(l_Parent_1.Thunks.SignalUpdateOutfitPermissionDenied);
local v10 = require(l_Parent_1.Thunks.PerformUpdateOutfit);
local v11 = require(l_Parent_0.Prompts.PromptWithAvatarViewport);
local v12 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v13 = v2.PureComponent:extend("UpdateOutfitPrompt");
v13.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    outfitName = v4.string, 
    signalUpdateOutfitPermissionDenied = v4.callback, 
    performUpdateOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v13.render = function(v14)
    local _ = nil;
    return v2.createElement(v11, {
        humanoidDescription = v14.props.humanoidDescription, 
        rigType = v14.props.rigType, 
        title = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTitle"), 
        bodyText = if not v14.props.showCustomOutfitNames then v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTextNoOutfitName") else v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptText", {
            RBX_NAME = v14.props.outfitName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v14.props.signalUpdateOutfitPermissionDenied, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14.props.performUpdateOutfit, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
return (v12.connect(function(v16, _)
    return {
        showCustomOutfitNames = v16.getCustomOutfitNames()
    };
end)((v3.connect(function(v18)
    return {
        screenSize = v18.screenSize, 
        humanoidDescription = v18.promptInfo.humanoidDescription, 
        rigType = v18.promptInfo.rigType, 
        outfitName = v18.promptInfo.outfitName
    };
end, function(v19)
    return {
        signalUpdateOutfitPermissionDenied = function()
            return v19(v9);
        end, 
        performUpdateOutfit = function()
            return v19(v10);
        end or nil
    };
end)(v13))));
