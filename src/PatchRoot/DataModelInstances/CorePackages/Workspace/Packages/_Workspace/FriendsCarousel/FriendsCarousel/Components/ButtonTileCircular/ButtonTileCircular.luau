local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RobloxAppHooks);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.Style);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_Badge_0 = v4.App.Indicator.Badge;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = v7.useDesignTokens;
local l_useUiModeInfo_0 = v5.useUiModeInfo;
local l_UiMode_0 = v6.UiMode;
local l_FFlagLuaAppFixCursorHooks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixCursorHooks;
local v18 = game:DefineFastFlag("AddFriendsBtnFixSelectionOnConsole", false);
local v19 = UDim.new(0.5, 0);
local v20 = {
    layoutOrder = 0, 
    onActivated = function()
    end, 
    tileSize = 96, 
    title = ""
};
return function(v21)
    local v22 = v2.useMemo(function()
        return v3.Dictionary.join(v20, v21 or {});
    end, {
        v20, 
        v21
    });
    local v23 = l_useStyle_0();
    local v24 = l_useUiModeInfo_0();
    local v26 = l_useDesignTokens_0(function(v25)
        if v24.uiMode == l_UiMode_0.TenFoot then
            return {
                tilePadding = v25.Global.Space_100, 
                textFont = v25.Semantic.Typography.CaptionHeader
            };
        else
            return {
                tilePadding = 8, 
                textFont = v23.Font.CaptionHeader
            };
        end;
    end);
    return v1.createFragment({
        ButtonTileCircular = v2.createElement("Frame", {
            Size = UDim2.new(0, v22.tileSize, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.layoutOrder
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v26.tilePadding)
            }), 
            Button = v2.createElement("TextButton", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, v22.tileSize, 0, v22.tileSize), 
                BackgroundColor3 = if not v22.backgroundColor then v23.Theme.UIEmphasis.Color else v22.backgroundColor, 
                Text = "", 
                BackgroundTransparency = if not v22.backgroundColor then v23.Theme.UIEmphasis.Transparency else 0, 
                SelectionImageObject = if not l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(v19) else if not l_FFlagLuaAppFixCursorHooks_0 then nil else l_useCursor_0(v19), 
                [v2.Event.Activated] = v22.onActivated
            }, {
                StrokeWrapper = if not v22.noBorder then v1.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.new(1, -4, 1, -4), 
                    BackgroundTransparency = 1, 
                    ZIndex = 0
                }, {
                    UICorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UIStroke = v1.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = v23.Theme.IconEmphasis.Color, 
                        Transparency = v23.Theme.SecondaryDefault.Transparency
                    })
                }) else nil, 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v22.icon, 
                    ImageColor3 = v22.iconColor or v23.Theme.IconEmphasis.Color, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                }), 
                Badge = if not v22.badgeValue then nil else v2.createElement(l_Badge_0, {
                    anchorPoint = Vector2.new(1, 0), 
                    position = UDim2.fromOffset(v22.tileSize - 5, 5), 
                    value = v22.badgeValue
                }), 
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = v19
                })
            }), 
            ButtonLabel = v2.createElement("TextButton", {
                LayoutOrder = 2, 
                Size = UDim2.new(0, v22.tileSize, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = "", 
                [v2.Event.Activated] = v22.onActivated, 
                Selectable = if not v18 then nil else false
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Label = v2.createElement(l_StyledTextLabel_0, {
                    text = v22.title, 
                    fontStyle = v26.textFont, 
                    colorStyle = v23.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1
                })
            })
        })
    });
end;
