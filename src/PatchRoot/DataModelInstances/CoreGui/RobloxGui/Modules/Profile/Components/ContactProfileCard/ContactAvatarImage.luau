local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_getDeepValue_0 = v0.SocialLibraries.Dictionary.getDeepValue;
local l_useSelector_0 = v0.useSelector;
local l_useLocalization_0 = v0.useLocalization;
l_Roact_0.PureComponent:extend("AvatarImage").defaultProps = {
    padding = 24
};
return function(v12)
    local v13 = l_useStyle_0();
    local v14 = l_useLocalization_0({
        fromContacts = "Feature.Friends.Description.FromContacts"
    });
    local v15 = v12.avatarAssetHashId or "";
    local v17 = l_useSelector_0(function(v16)
        return l_getDeepValue_0(v16, (("Profile.ContactAvatarId.%*.imageUrl"):format(v15))) or "";
    end);
    local l_width_0 = v12.width;
    local v19 = l_Images_0[v13.Theme.PlayerBackgroundDefault.Image];
    local function v20()
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            Image = l_Images_0["component_assets/contactFullAvatar_large"], 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 2
        });
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.fromOffset(l_width_0, l_width_0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder
    }, {
        Background = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = v19, 
            ZIndex = 1
        }), 
        AvatarThumbnail = if not v12.avatarImageUrl then if not (v15 ~= "") or v15 == "0" then l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            Image = l_Images_0["component_assets/contactFullAvatar_large"], 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }) else l_Roact_0.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -96, 1, -96), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v17, 
            useShimmerAnimationWhileLoading = true, 
            renderOnFailed = v20, 
            ZIndex = 2
        }) else l_Roact_0.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -96, 1, -96), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v12.avatarImageUrl, 
            useShimmerAnimationWhileLoading = true, 
            renderOnFailed = v20, 
            ZIndex = 2
        }), 
        TopGradient = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = v13.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v13.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        UserDetails = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 0, 112), 
            position = UDim2.fromScale(0, 0.9), 
            anchorPoint = Vector2.new(0, 1), 
            zIndex = 4, 
            backgroundTransparency = 1
        }, {
            UserDetailsLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding1 = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            ContactName = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = v12.contactName, 
                size = UDim2.new(1, 0, 0, 24), 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v13.Font.Header1, 
                colorStyle = v13.Theme.TextEmphasis, 
                layoutOrder = 2
            }), 
            padding2 = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(0, 15), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }), 
            Description = l_Roact_0.createElement(l_StyledTextLabel_0, {
                size = UDim2.new(1, 0, 0, 16), 
                text = v14.fromContacts, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v13.Font.CaptionHeader, 
                colorStyle = v13.Theme.TextMuted, 
                layoutOrder = 4
            }), 
            padding3 = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(0, 19), 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            })
        })
    });
end;
