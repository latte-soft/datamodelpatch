local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
return function(v6)
    return l_withLocalization_0({
        errorTitle = "Feature.ReportAbuse.Heading.SelectInSceneErrorTitle", 
        errorDescription = "Feature.ReportAbuse.Label.SelectInSceneErrorDescription", 
        errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack"
    })(function(v7)
        return v1.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.3, 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v1.Event.Activated] = v6.onBack, 
            ZIndex = 10
        }, {
            Alert = v1.createElement(l_InteractiveAlert_0, {
                screenSize = v6.screenSize, 
                title = v7.errorTitle, 
                bodyText = v7.errorDescription, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v6.onBack, 
                                text = v7.errorBack
                            }
                        }
                    }
                }
            })
        });
    end);
end;
