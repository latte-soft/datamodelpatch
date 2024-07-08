local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local v9 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Thunks.SignalDeleteOutfitPermissionDenied);
local v12 = require(l_Parent_0.Thunks.PerformDeleteOutfit);
local v13 = require(l_Parent_0.AvatarEditorPromptsPolicy);
local v14 = v2.PureComponent:extend("DeleteOutfitPrompt");
v14.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    outfitId = v4.integer, 
    outfitName = v4.string, 
    performDeleteOutfit = v4.callback, 
    signalDeleteOutfitPermissionDenied = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v14.init = function(v15)
    v15.renderAlertMiddleContent = function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150)
        }, {
            Thumnail = v2.createElement(l_LoadableImage_0, {
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(150, 150), 
                BackgroundTransparency = 1, 
                Image = "rbxthumb://type=Outfit&id=" .. v15.props.outfitId .. "&w=150&h=150", 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true
            })
        });
    end;
end;
v14.render = function(v16)
    local _ = nil;
    return v2.createElement(l_InteractiveAlert_0, {
        title = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTitle"), 
        bodyText = if not v16.props.showCustomOutfitNames then v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTextNoName") else v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptText", {
            RBX_NAME = v16.props.outfitName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.props.signalDeleteOutfitPermissionDenied, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v16.props.performDeleteOutfit, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v16.props.screenSize, 
        middleContent = v16.renderAlertMiddleContent, 
        isMiddleContentFocusable = false
    });
end;
return (v13.connect(function(v18, _)
    return {
        showCustomOutfitNames = v18.getCustomOutfitNames()
    };
end)((v3.connect(function(v20)
    return {
        screenSize = v20.screenSize, 
        outfitId = v20.promptInfo.outfitId, 
        outfitName = v20.promptInfo.outfitName
    };
end, function(v21)
    return {
        signalDeleteOutfitPermissionDenied = function()
            return v21(v11);
        end, 
        performDeleteOutfit = function()
            return v21(v12);
        end
    };
end)(v14))));
