local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = require(l_Modules_0.Shell.GlobalSettings);
local v9 = require(l_Modules_0.Shell.LocalizedStrings);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v12 = require(l_Modules_0.Shell.Components.Overscan.ControllerHint);
local v13 = require(script.Parent.Edges);
return function(v14)
    local v15 = v14.onUnmount or l_useNavigation_0().goBack;
    local v16 = l_useLocalization_0({
        accept = "CommonUI.Controls.Action.Accept", 
        cancel = "CommonUI.Controls.Action.Cancel"
    });
    local v18 = l_useDesignTokens_0(function(v17)
        return {
            buttonHeight = v17.Global.Size_600, 
            marginBetween = v17.Global.Space_150
        };
    end);
    local v19 = l_useStyle_0();
    local v20 = v2.useRef(nil);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 1, 
        BackgroundTransparency = v14.BackgroundTransparency, 
        BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941)
    }, {
        v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941), 
            BorderSizePixel = 1, 
            Visible = v14.ImageVisible, 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png"
        }); 
        Title = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 205), 
            BackgroundTransparency = 1, 
            Font = v8.LightFont, 
            FontSize = v8.HeaderSize, 
            TextColor3 = v8.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = v9:LocalizedString("ScreenSizeWord")
        }), 
        Prompt = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 243), 
            BackgroundTransparency = 1, 
            Font = v8.RegularFont, 
            FontSize = v8.ButtonSize, 
            TextColor3 = v8.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = v9:LocalizedString("ResizeScreenPrompt")
        }), 
        Controller = v2.createElement(v12), 
        Actions = v2.createElement("Frame", {
            Size = UDim2.fromScale(0.4, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -201)
        }, {
            v2.createElement(l_ButtonStack_0, {
                buttonHeight = v18.buttonHeight, 
                marginBetween = v18.marginBetween, 
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            text = v16.cancel, 
                            fontStyle = v19.Font.Header1, 
                            onActivated = v15
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v16.accept, 
                            fontStyle = v19.Font.Header1, 
                            onActivated = function()
                                if v20.current then
                                    v20.current.onAccept();
                                end;
                            end
                        }
                    }
                }
            })
        }), 
        EdgeSelector = v2.createElement(v13, {
            onSetEdges = v15, 
            ref = v20
        })
    });
end;
