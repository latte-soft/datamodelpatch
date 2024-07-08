local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v14 = Color3.new(1, 1, 1);
local v15 = l_Images_0["icons/common/refresh"];
local v16 = l_Images_0["icons/graphic/error_xlarge"];
return function(v17)
    local v18 = l_useStyle_0();
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Wrapper = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ImageWrapper = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = v14, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
                LayoutOrder = 1
            }, {
                FailedImage = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v16, 
                    Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    LayoutOrder = 1
                })
            }), 
            Spacer1 = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 12), 
                LayoutOrder = 2
            }), 
            FailedMessage = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 3, 
                size = UDim2.new(1, 0, 0, 0), 
                text = l_useLocalization_0({
                    failedToLoadMessage = v6.FailedToLoad
                }).failedToLoadMessage, 
                fontStyle = v18.Font.CaptionBody, 
                colorStyle = v18.Theme.TextMuted, 
                automaticSize = Enum.AutomaticSize.Y, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fluidSizing = false, 
                richText = false
            }), 
            Spacer2 = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 20), 
                LayoutOrder = 4
            }), 
            RetryButton = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                standardSize = l_StandardButtonSize_0.Regular, 
                layoutOrder = 5, 
                icon = v15, 
                onActivated = v17.onActivated
            })
        })
    });
end;
