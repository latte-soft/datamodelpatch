local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_llama_0 = v1.llama;
local l_UIBlox_0 = v1.UIBlox;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v12 = require(script.Parent.PlayerName);
local v13 = require(l_Parent_0.Utils.getTextHeight);
local v14 = l_Images_0["component_assets/circle_25"];
local v15 = {
    username = "", 
    thumbnail = "", 
    tileSize = 100, 
    contextualInfoLines = 1
};
local function v16()
end;
return function(v17)
    local v18 = l_llama_0.Dictionary.join(v15, v17 or {});
    local l_tileSize_0 = v18.tileSize;
    local v20 = l_Roact_0.createRef();
    local v21 = l_React_0.useCallback(function()
        if not (not v20 or not v18.onActivated) then
            v18.onActivated(v20);
        end;
    end, {
        v20
    });
    local v22 = l_useStyle_0();
    local l_CaptionSubHeader_0 = v22.Font.CaptionSubHeader;
    return l_Roact_0.createFragment({
        UserTileSquare = l_Roact_0.createElement("Frame", {
            [l_Roact_0.Ref] = v20, 
            LayoutOrder = v18.layoutOrder, 
            Size = UDim2.fromOffset(l_tileSize_0, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PlayerAvatarFrame = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
                BackgroundTransparency = 1
            }, {
                PlayerAvatar = l_Roact_0.createElement(l_PlayerTile_0, {
                    tileSize = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
                    thumbnail = v18.thumbnail, 
                    onActivated = v21, 
                    buttons = v18.buttons
                })
            }), 
            Padding1 = l_Roact_0.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, 8), 
                BackgroundTransparency = 1
            }), 
            UserInfo = l_Roact_0.createElement(l_Interactable_0, {
                LayoutOrder = 3, 
                [l_Roact_0.Event.Activated] = v21, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                onStateChanged = v16, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerName = l_Roact_0.createElement(v12, {
                    layoutOrder = 1, 
                    name = v18.username, 
                    tileSize = l_tileSize_0
                }), 
                Padding2 = l_Roact_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(0, 2), 
                    BackgroundTransparency = 1
                }), 
                ContextualInfoFrame = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PresenceIcon = not not v18.showOnlineIndicator and l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = v14, 
                        ImageColor3 = v22.Theme.OnlineStatus.Color, 
                        ImageTransparency = v22.Theme.OnlineStatus.Transparency, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.new(0, 12, 0, 12), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice
                    }) or nil, 
                    ContextualInfo = not not v18.contextualText and l_Roact_0.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        text = v18.contextualText, 
                        fontStyle = l_CaptionSubHeader_0, 
                        size = UDim2.fromOffset(if not v18.showOnlineIndicator then v18.tileSize else v18.tileSize - 16, l_React_0.useMemo(function()
                            return v13(v18.contextualText, l_CaptionSubHeader_0.Font, v22.Font.BaseSize * v22.Font.CaptionSubHeader.RelativeSize);
                        end, {
                            v18.contextualText
                        }) * v18.contextualInfoLines), 
                        colorStyle = not not v18.isContextualTextMuted and v22.Theme.TextMuted or v22.Theme.TextEmphasis, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        fluidSizing = false, 
                        richText = false, 
                        lineHeight = 1
                    }) or nil
                })
            })
        })
    });
end;
