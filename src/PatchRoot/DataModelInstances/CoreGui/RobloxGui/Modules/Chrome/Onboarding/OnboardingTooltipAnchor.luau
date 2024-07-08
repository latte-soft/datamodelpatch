local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withTooltip_0 = v3.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v3.App.Dialog.Enum.TooltipOrientation;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
return (v2.forwardRef(function(v11, v12)
    local l_step_0 = v11.step;
    local l_onboardingStep_0 = v11.onboardingStep;
    local l_maxSteps_0 = v11.maxSteps;
    local l_completeLabel_0 = v11.completeLabel;
    local l_showLabels_0 = v11.showLabels;
    local l_onDismiss_0 = v11.onDismiss;
    local l_onNext_0 = v11.onNext;
    local v20 = l_useStyle_0();
    return l_withTooltip_0({
        minContentWidth = 210, 
        ref = v12, 
        headerText = l_onboardingStep_0.headerText, 
        renderCustomComponents = function(v21)
            return v2.createElement("Frame", {
                Name = "OnboardingTooltipFrame", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v21, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Body = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 0, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    fontStyle = v20.Font.Footer, 
                    colorStyle = v20.Theme.TextDefault, 
                    text = l_onboardingStep_0.bodyText, 
                    textTruncate = Enum.TextTruncate.None, 
                    textXAlignment = Enum.TextXAlignment.Left
                }), 
                Footer = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Label = v2.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        fontStyle = v20.Font.Footer, 
                        colorStyle = v20.Theme.TextDefault, 
                        text = not l_showLabels_0 and "" or tostring(l_step_0) .. " / " .. tostring(l_maxSteps_0), 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        size = UDim2.fromScale(0.5, 1)
                    }), 
                    Button = v2.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        standardSize = l_StandardButtonSize_0.XSmall, 
                        layoutOrder = 2, 
                        onActivated = function()
                            l_onNext_0();
                        end, 
                        text = if l_step_0 == l_maxSteps_0 then l_completeLabel_0 else l_onboardingStep_0.buttonText, 
                        size = UDim2.new(1, 0, 0, 36), 
                        anchorPoint = Vector2.new(1, 0), 
                        position = UDim2.new(1, 0, 0, 0)
                    }) or nil
                })
            });
        end, 
        onClose = function()
            l_onDismiss_0();
        end, 
        backgroundColor = v20.Theme.BackgroundUIDefault.Color, 
        backgroundTransparency = v20.Theme.BackgroundUIDefault.Transparency
    }, {
        DisplayOrder = 10, 
        active = true, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    }, function(v22)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = v22, 
            [v2.Change.AbsolutePosition] = v22
        });
    end);
end));
