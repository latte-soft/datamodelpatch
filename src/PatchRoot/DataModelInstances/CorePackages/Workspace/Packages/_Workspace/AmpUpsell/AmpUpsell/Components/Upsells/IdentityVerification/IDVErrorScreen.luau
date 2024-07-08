local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.React);
local l_IconSize_0 = v1.App.Constant.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local l_PartialPageModal_0 = v1.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v11)
    local l_errorTitle_0 = v11.errorTitle;
    local l_errorDescription_0 = v11.errorDescription;
    local l_onClose_0 = v11.onClose;
    local l_buttonText_0 = v11.buttonText;
    local v16 = l_useStyle_0();
    return v2.createElement(l_PartialPageModal_0, {
        title = l_errorTitle_0, 
        screenSize = l_useSelector_0(function(v17)
            return v17.ScreenSize;
        end), 
        onCloseClicked = function()
            l_onClose_0();
        end, 
        bottomPadding = 20, 
        buttonStackProps = {
            forcedFillDirection = Enum.FillDirection.Horizontal, 
            buttonHeight = 48, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = function()
                            l_onClose_0();
                        end, 
                        text = l_buttonText_0
                    }
                }
            }
        }
    }, {
        ViewFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 20)
            }), 
            ImageIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, l_IconSize_0.XXLarge, 0, l_IconSize_0.XXLarge), 
                ScaleType = Enum.ScaleType.Fit, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/graphic/error_xlarge"], 
                ImageTransparency = v16.Theme.SystemPrimaryDefault.Transparency
            }), 
            ErrorText = v2.createElement(l_StyledTextLabel_0, {
                text = l_errorDescription_0, 
                fontStyle = v16.Font.CaptionBody, 
                colorStyle = v16.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2
            })
        })
    });
end;
