local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v4 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
return function(v9)
    local v10, v11 = v2.useState(false);
    local v12 = l_useLocalization_0({
        newAppAvailableText = "Authentication.Login.Heading.NewAppAvailable", 
        descriptionText = "Authentication.Login.Description.DownloadNewVersion", 
        downloadNowText = "Authentication.Login.Action.DownloadNow"
    });
    local v13 = l_useDispatch_0();
    local v14 = v2.useCallback(function()
        v13(v3());
    end, {
        v13
    });
    return v2.createElement("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = true, 
        [v2.Event.Activated] = function()
            v14();
        end
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = v12.newAppAvailableText, 
            bodyText = v12.descriptionText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v12.downloadNowText, 
                            isDefaultChild = true, 
                            isDisabled = v10, 
                            isLoading = v10, 
                            onActivated = function()
                                v11(true);
                                if v9.onButtonActivated then
                                    v9.onButtonActivated();
                                end;
                                v14();
                            end
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = Vector2.new(300, nil)
        })
    });
end;
