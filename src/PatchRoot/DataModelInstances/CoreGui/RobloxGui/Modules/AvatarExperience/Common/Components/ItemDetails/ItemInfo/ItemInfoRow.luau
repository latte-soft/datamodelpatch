local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v4 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v11 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v12 = l_Images_0["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small";
local v13 = Vector2.new(14, 14);
return (v2.forwardRef(function(v14, v15)
    local l_LayoutOrder_0 = v14.LayoutOrder;
    local l_infoName_0 = v14.infoName;
    local l_infoData_0 = v14.infoData;
    local l_onActivate_0 = v14.onActivate;
    local l_hasVerifiedBadge_0 = v14.hasVerifiedBadge;
    local v21 = l_useStyle_0();
    local l_Theme_0 = v21.Theme;
    local l_Font_0 = v21.Font;
    local v24 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v25 = v11({
        name = l_infoName_0
    });
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local v27 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v28 = -11 - v13.X;
    local v29 = v15 ~= nil;
    return v2.createElement(not v29 and "ImageButton" or l_Focusable_0.ImageButton, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, not v14.hideDivider and 53 or 52), 
        [v2.Event.Activated] = l_onActivate_0, 
        NextSelectionUp = v14.NextSelectionUp, 
        NextSelectionDown = v14.NextSelectionDown, 
        NextSelectionLeft = v14.NextSelectionLeft, 
        NextSelectionRight = v14.NextSelectionRight, 
        ref = v15, 
        SelectionImageObject = not not v29 and v24 or nil
    }, {
        Container = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, not v14.hideDivider and -1 or 0)
        }, {
            InfoNameTextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = v25.name, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = v27, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            InfoDataWithEmoji = l_hasVerifiedBadge_0 and v2.createElement(v4.EmojiWrapper, {
                emoji = v4.emoji.verified, 
                font = if not l_onActivate_0 then l_Font_0.Body.Font else l_Font_0.Header2.Font, 
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.new(1, not l_onActivate_0 and 0 or v28, 0, 0), 
                size = UDim2.new(0.5, 0, 1, 0), 
                automaticSize = Enum.AutomaticSize.None, 
                horizontalAlignment = Enum.HorizontalAlignment.Right, 
                verticalAlignment = Enum.VerticalAlignment.Center
            }, {
                InfoDataTextLabel = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = not not l_onActivate_0 and l_Font_0.Header2.Font or l_Font_0.Body.Font, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Text = v25.data or l_infoData_0, 
                    TextColor3 = if not l_onActivate_0 then l_Theme_0.TextDefault.Color else l_Theme_0.TextEmphasis.Color, 
                    TextSize = v27, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = v14.TextScaled, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            InfoDataTextLabel = not l_hasVerifiedBadge_0 and v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, not l_onActivate_0 and 0 or v28, 0, 0), 
                BackgroundTransparency = 1, 
                Font = if not l_onActivate_0 then l_Font_0.Body.Font else l_Font_0.Header2.Font, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = v25.data or l_infoData_0, 
                TextColor3 = if not l_onActivate_0 then l_Theme_0.TextDefault.Color else l_Theme_0.TextEmphasis.Color, 
                TextSize = v27, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextScaled = v14.TextScaled, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                TextSizeConstraint = v14.TextScaled and v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = v27
                })
            }), 
            LinkIcon = l_onActivate_0 and v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.fromOffset(v13.X, v13.Y), 
                Image = v12, 
                ImageColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            })
        }), 
        Divider = not v14.hideDivider and v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, -1)
        })
    });
end));
