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
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local v15 = require(l_script_FirstAncestor_0.Utils.useLocalUserInfo);
local v16 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v18 = l_Images_0["icons/menu/scanqr"];
local v19 = l_Images_0["icons/navigation/close"];
return function(v20)
    local v21 = l_useLocalization_0({
        notificationRequest = v6.NotificationRequest, 
        acceptFriend = v6.AcceptFriend
    });
    local v22 = l_useStyle_0();
    local v23 = v15(v20.userId);
    local v24 = v16();
    local v25, v26 = v2.useState(false);
    v2.useEffect(function()
        v24.fireEvent(v17.QRPageFriendRequestBannerShown, {
            qrCodeBannerQueueSize = v20.notificationQueueSize
        });
    end, {
        v20.userId
    });
    return v2.createElement("Frame", {
        ZIndex = 2, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v22.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v22.Theme.BackgroundUIDefault.Transparency
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Color = v22.Theme.Divider.Color, 
            Transparency = v22.Theme.Divider.Transparency, 
            Thickness = 1
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, math.huge)
        }), 
        UpperFrame = v2.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            QRCodeImageFrame = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 40, 0, 40), 
                BorderSizePixel = 0
            }, {
                QRImage = v2.createElement(l_ImageSetLabel_0, {
                    Image = v18, 
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0, 
                    ImageColor3 = v22.Theme.TextEmphasis.Color, 
                    Size = UDim2.new(0, 40, 0, 40)
                })
            }), 
            TextFrame = v2.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -72, 0, 0), 
                BorderSizePixel = 0
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Username = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v23.displayName, 
                    Font = v22.Font.Header2.Font, 
                    fontStyle = v22.Font.Header2, 
                    colorStyle = v22.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 20), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextWrapped = true
                }), 
                Spacer1 = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 5), 
                    LayoutOrder = 2
                }), 
                Description = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v21.notificationRequest, 
                    Font = v22.Font.CaptionBody.Font, 
                    fontStyle = v22.Font.Body, 
                    colorStyle = v22.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 28), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextWrapped = true, 
                    lineHeight = 1
                })
            }), 
            CloseButtonFrame = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 32, 0, 32), 
                BorderSizePixel = 0
            }, {
                CloseButton = v2.createElement(l_IconButton_0, {
                    icon = v19, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v20.onClose, 
                    anchorPoint = Vector2.new(0.13, 0.13)
                })
            })
        }), 
        AcceptButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 2, 
            standardSize = l_StandardButtonSize_0.Small, 
            text = v21.acceptFriend, 
            fontStyle = v22.Font.CaptionBody, 
            isDisabled = v25, 
            onActivated = function()
                v26(true);
                v20.onAccept(v20.userId);
            end
        })
    });
end;
