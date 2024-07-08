local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_llama_0 = v1.llama;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = v1.Hooks.useDesignTokens;
local l_useUiModeInfo_0 = v1.Hooks.useUiModeInfo;
local l_UiMode_0 = v1.RobloxAppEnums.UiMode;
local v16 = require(l_script_FirstAncestor_0.Utils.getTextHeight);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagFriendsCarouselCircularBadge);
local l_getFFlagUpdateFriendCarousel10ft_0 = v1.getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselInjectSocialBtn_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselInjectSocialBtn;
local l_FFlagLuaAppFixCursorHooks_0 = v1.FFlagLuaAppFixCursorHooks;
if not l_FFlagFriendsCarouselInjectSocialBtn_0 then
    local v21 = {
        layoutOrder = 0, 
        onActivated = function()
        end, 
        thumbnailSize = 96, 
        totalHeight = 96, 
        labelText = ""
    };
    local v22 = l_Images_0["icons/menu/friends_large"];
    local v23 = l_Images_0["component_assets/circle_68_stroke_2"];
    local v24 = UDim.new(0.5, 0);
    return function(v25)
        local v26 = l_llama_0.Dictionary.join(v21, v25 or {});
        local v27 = l_useStyle_0();
        local v28 = l_useUiModeInfo_0();
        local v30 = l_useDesignTokens_0(function(v29)
            if v28.uiMode == l_UiMode_0.TenFoot then
                return {
                    tilePadding = v29.Global.Space_100, 
                    textFont = v29.Semantic.Typography.CaptionHeader
                };
            else
                return {
                    tilePadding = 8, 
                    textFont = v27.Font.CaptionHeader
                };
            end;
        end);
        return l_Roact_0.createFragment({
            AddFriendsTileCircular = l_Roact_0.createElement("Frame", {
                Size = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim2.new(0, v26.thumbnailSize, 0, v26.totalHeight) else UDim2.new(0, v26.thumbnailSize, 0, 0), 
                AutomaticSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v26.layoutOrder
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = if not l_getFFlagUpdateFriendCarousel10ft_0() then UDim.new(0, 8) else UDim.new(0, v30.tilePadding)
                }), 
                AddFriendButton = l_Roact_0.createElement("TextButton", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v26.thumbnailSize, 0, v26.thumbnailSize), 
                    BackgroundColor3 = v27.Theme.UIEmphasis.Color, 
                    Text = "", 
                    BackgroundTransparency = v27.Theme.UIEmphasis.Transparency, 
                    SelectionImageObject = if not l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(v24) else if not l_FFlagLuaAppFixCursorHooks_0 then nil else l_useCursor_0(v24), 
                    [l_Roact_0.Event.Activated] = v26.onActivated
                }, {
                    AddFriendButtonBorder = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Image = v23, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = v27.Theme.SecondaryDefault.Color, 
                        ImageTransparency = v27.Theme.SecondaryDefault.Transparency, 
                        Size = UDim2.new(0, v26.thumbnailSize, 0, v26.thumbnailSize)
                    }, {
                        AddIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v22, 
                            ImageColor3 = v27.Theme.IconEmphasis.Color, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                        }), 
                        Badge = if not v17() then nil else v26.badgeValue and l_Roact_0.createElement(l_Badge_0, {
                            anchorPoint = Vector2.new(1, 0), 
                            position = UDim2.fromOffset(v26.thumbnailSize - 5, 5), 
                            value = v26.badgeValue
                        })
                    }), 
                    UICorner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = v24
                    })
                }), 
                AddFriendsLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v26.labelText, 
                    fontStyle = if not l_getFFlagUpdateFriendCarousel10ft_0() then v27.Font.CaptionHeader else v30.textFont, 
                    colorStyle = v27.Theme.TextEmphasis, 
                    size = if l_getFFlagUpdateFriendCarousel10ft_0() then nil else UDim2.fromOffset(v26.thumbnailSize, v16(v26.labelText, v27.Font.CaptionHeader.Font, v27.Font.BaseSize * v27.Font.CaptionHeader.RelativeSize)), 
                    automaticSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else Enum.AutomaticSize.XY, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1
                })
            })
        });
    end;
else
    return nil;
end;
