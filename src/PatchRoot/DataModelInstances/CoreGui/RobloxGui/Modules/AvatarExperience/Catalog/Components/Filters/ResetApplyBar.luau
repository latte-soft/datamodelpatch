local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
return function(v12)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v14 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply", 
        reset = "CommonUI.Messages.Action.Reset"
    });
    local v15 = v12.frameRef or v2.useRef(nil);
    local v16 = l_useProperty_0(v15, "AbsoluteSize");
    local v17 = not v16 and 0 or l_getPageMargin_0(v16.X);
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        Size = UDim2.new(1, 0, 0, v12.height), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        NextSelectionUp = v12.NextSelectionUp, 
        NextSelectionDown = v12.NextSelectionDown, 
        NextSelectionRight = v12.NextSelectionRight, 
        NextSelectionLeft = v12.NextSelectionLeft, 
        ref = v15
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v17), 
            PaddingRight = UDim.new(0, v17), 
            PaddingTop = UDim.new(0, 32)
        }), 
        Gradient = v2.createElement("UIGradient", {
            Rotation = 270, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(0.8, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(1, 1)
            })
        }), 
        Buttons = v2.createElement(l_ButtonStack_0, {
            buttons = {
                {
                    props = {
                        onActivated = v12.onReset, 
                        text = v14.reset, 
                        isDisabled = not v12.canReset
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v12.onApply, 
                        text = v14.apply, 
                        isDisabled = not v12.canApply
                    }, 
                    isDefaultChild = true
                }
            }
        })
    });
end;
