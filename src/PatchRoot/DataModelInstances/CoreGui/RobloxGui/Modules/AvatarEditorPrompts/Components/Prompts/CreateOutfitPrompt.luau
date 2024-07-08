local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = require(l_CorePackages_0.UIBlox).App.Button.Enum.ButtonType;
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v9 = require(l_Parent_0.Prompts.PromptWithAvatarViewport);
local v10 = require(l_Parent_1.Thunks.SignalCreateOutfitPermissionDenied);
local v11 = require(l_Parent_1.Actions.CreateOutfitConfirmed);
local v12 = require(l_Parent_1.Thunks.PerformCreateOutfit);
local v13 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v14 = v2.PureComponent:extend("CreateOutfitPrompt");
v14.validateProps = v4.strictInterface({
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    createOutfitConfirmed = v4.callback, 
    signalCreateOutfitPermissionDenied = v4.callback, 
    performCreateOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v14.render = function(v15)
    local _ = nil;
    return v2.createElement(v9, {
        humanoidDescription = v15.props.humanoidDescription, 
        rigType = v15.props.rigType, 
        title = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"), 
        bodyText = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v15.props.signalCreateOutfitPermissionDenied, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = if not v15.props.showCustomOutfitNames then v15.props.performCreateOutfit else v15.props.createOutfitConfirmed, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
return (v13.connect(function(v17, _)
    return {
        showCustomOutfitNames = v17.getCustomOutfitNames()
    };
end)((v3.connect(function(v19)
    return {
        humanoidDescription = v19.promptInfo.humanoidDescription, 
        rigType = v19.promptInfo.rigType
    };
end, function(v20)
    return {
        signalCreateOutfitPermissionDenied = function()
            return v20(v10);
        end, 
        createOutfitConfirmed = function()
            return v20(v11());
        end, 
        performCreateOutfit = function()
            return v20(v12(""));
        end
    };
end)(v14))));
