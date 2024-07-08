local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local v6 = require(l_script_FirstAncestor_0.Components.ProfileQRCodeTopElements);
local v7 = require(l_script_FirstAncestor_0.Components.QRCodeView);
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useIsWideMode_0 = require(l_Parent_0.SocialCommon).Hooks.useIsWideMode;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v12 = Color3.new(1, 1, 1);
return function(v13)
    local v14 = l_useLocalization_0({
        description = v8.Description
    });
    local v15, v16 = v2.useState(false);
    local v17 = l_useIsWideMode_0();
    local v18 = l_useStyle_0();
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopElements = v2.createElement(v6, {
            appStorageService = v13.appStorageService, 
            onClose = v13.onClose, 
            openQrCodeScanner = v13.openQrCodeScanner, 
            robloxEventReceiver = v13.robloxEventReceiver
        }), 
        GradientBackground = v2.createElement("Frame", {
            BackgroundColor3 = v12, 
            BackgroundTransparency = not v17 and 1 or 0.7, 
            Position = UDim2.fromScale(0, 0), 
            Size = if not v17 then UDim2.fromScale(1, 1) else UDim2.fromScale(0.6, 1), 
            BorderSizePixel = 0, 
            [v2.Change.AbsoluteSize] = v2.useCallback(function(v19)
                if v19.AbsoluteSize.Y >= 450 then
                    v16(true);
                    return ;
                else
                    v16(false);
                    return ;
                end;
            end)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Content = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = if not v17 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, 0, 1, -56), 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24)
                }), 
                QRCodeView = v2.createElement(v7, {
                    layoutOrder = 1, 
                    isSmallScreen = v15
                }), 
                Spacer1 = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(0, not v15 and 24 or 12), 
                    LayoutOrder = 2
                }), 
                Description = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v14.description, 
                    fontStyle = v18.Font.CaptionBody, 
                    lineHeight = 1, 
                    colorStyle = v18.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fluidSizing = false, 
                    richText = false
                }), 
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 420)
                })
            }), 
            Gradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v18.Theme.BackgroundContrast.Color), 
                    ColorSequenceKeypoint.new(1, v18.Theme.BackgroundContrast.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.4), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;
