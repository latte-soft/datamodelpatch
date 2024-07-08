local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = require(l_CorePackages_0.UIBlox).App.Button.Enum.ButtonType;
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v9 = require(l_Parent_0.Prompts.PromptWithTextField);
local v10 = require(l_Parent_1.Thunks.SignalCreateOutfitPermissionDenied);
local v11 = require(l_Parent_1.Thunks.PerformCreateOutfit);
local v12 = v2.PureComponent:extend("EnterOutfitNamePrompt");
v12.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    signalCreateOutfitPermissionDenied = v4.callback, 
    performCreateOutfit = v4.callback
});
v12.init = function(v13)
    v13:setState({
        outfitName = "", 
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v13.textBoxRef = v2.createRef();
    v13.confirmCreateOutfit = function()
        v13.props.performCreateOutfit(v13.state.outfitName);
    end;
    v13.textUpdated = function(v14)
        v13:setState({
            outfitName = v14
        });
    end;
end;
v12.render = function(v15)
    return v2.createElement(v9, {
        fieldText = v15.state.outfitName, 
        onFieldTextUpdated = v15.textUpdated, 
        title = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v15.props.signalCreateOutfitPermissionDenied, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = v15.state.outfitName == "", 
                        onActivated = v15.confirmCreateOutfit, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
return v3.connect(function(v16)
    return {
        screenSize = v16.screenSize
    };
end, function(v17)
    return {
        signalCreateOutfitPermissionDenied = function()
            return v17(v10);
        end, 
        performCreateOutfit = function(v18)
            return v17(v11(v18));
        end
    };
end)(v12);
