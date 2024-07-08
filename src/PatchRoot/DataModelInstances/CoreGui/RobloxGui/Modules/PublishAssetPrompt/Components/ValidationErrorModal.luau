local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.UIBlox);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_Overlay_0 = v2.App.Dialog.Overlay;
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v7 = v2.App.ImageSet.Images["icons/controls/keys/xboxA"];
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useIsGamepad_0 = v8.Hooks.useIsGamepad;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local v11 = require(l_CorePackages_0.Packages.React);
local v12 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
return function(v13)
    local v14 = l_useIsGamepad_0();
    local v15 = l_useDispatch_0();
    return v11.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 3
    }, {
        Overlay = v11.createElement(l_Overlay_0, {
            showGradient = false, 
            ZIndex = 3
        }), 
        InteractiveAlertWrapper = v11.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 4
        }, {
            InteractiveAlert = v11.createElement(l_InteractiveAlert_0, {
                title = "Something Went Wrong", 
                bodyText = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.", 
                screenSize = v13.screenSize, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = function()
                                    v15(v12());
                                end, 
                                text = v6:FormatByKey("InGame.CommonUI.Button.Ok"), 
                                inputIcon = not not v14 and v7 or nil
                            }
                        }
                    }
                }
            })
        })
    });
end;
