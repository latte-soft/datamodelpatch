local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local v9 = require(l_script_FirstAncestor_0.Components.Cells.BaseCell);
local v10 = {
    bodyText = "Placeholder body", 
    iconImage = nil, 
    iconSize = l_IconSize_0.Small, 
    iconCellWidth = 30, 
    cellHeight = 28, 
    onIconActivated = function()
    end
};
return function(v11)
    local v12 = v3.Dictionary.join(v10, v11);
    local v13 = v12.style or l_useStyle_0();
    local l_Theme_0 = v13.Theme;
    local l_Font_0 = v13.Font;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        ConversationTypeRow = v4.createElement(v9, {
            Size = UDim2.new(1, 0, 0, v12.cellHeight), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            showDivider = false, 
            dividerColor3 = l_Theme_0.Divider.Color, 
            dividerTransparency = l_Theme_0.Divider.Transparency, 
            isDisabled = true
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v13.Tokens.Global.Size_150)
            }), 
            TextFrame = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Text = v4.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Text = v12.bodyText, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                })
            }), 
            IconFrame = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.fromOffset(v12.iconCellWidth, v12.iconCellWidth), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                InfoIcon = v4.createElement(l_IconButton_0, {
                    position = UDim2.fromScale(0.5, 0.5), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    icon = v12.iconImage, 
                    iconColor3 = l_Theme_0.IconDefault.Color, 
                    iconTransparency = l_Theme_0.IconDefault.Transparency, 
                    iconSize = v12.iconSize, 
                    backgroundTransparency = 1, 
                    size = UDim2.fromOffset(v12.iconCellWidth, v12.iconCellWidth), 
                    onActivated = v12.onIconActivated
                })
            })
        })
    });
end;
