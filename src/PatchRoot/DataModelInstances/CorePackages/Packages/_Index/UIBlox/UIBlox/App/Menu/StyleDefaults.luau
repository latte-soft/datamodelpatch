local _ = require(script.Parent.Parent.Parent.App.Style.StyleTypes);
return {
    getBaseMenuDefaultTokens = function(v1)
        assert(v1.Tokens ~= nil, "Design token support is not enabled");
        return {
            elementHeight = v1.Tokens.Component.MenuCell.Base.Container.Height, 
            borderCornerRadius = v1.Tokens.Component.BaseMenu.BorderRadius, 
            background = {
                Color = v1.Tokens.Component.BaseMenu.BackgroundColor.Color3, 
                Transparency = v1.Tokens.Component.BaseMenu.BackgroundColor.Transparency
            }
        };
    end, 
    getCellDefaultTokens = function(v2)
        assert(v2.Tokens ~= nil, "Design token support is not enabled");
        return {
            iconSize = v2.Tokens.Component.MenuCell.Base.IconFrame.Size, 
            selectedIconSize = v2.Tokens.Component.MenuCell.Base.CheckFrame.Size, 
            iconPaddingLeft = v2.Tokens.Component.MenuCell.Base.Container.Spacing.Leading, 
            textPadding = {
                left = v2.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Leading, 
                right = v2.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Trailing
            }, 
            fontStyle = {
                Font = v2.Tokens.Component.MenuCell.Base.Text.Typography.Font, 
                RelativeSize = v2.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / v2.Font.BaseSize, 
                RelativeMinSize = v2.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / v2.Font.BaseSize
            }, 
            dividerSize = v2.Tokens.Component.MenuCell.Divider.Container.BorderWidth, 
            selectedIconPaddingRight = v2.Tokens.Component.MenuCell.Base.Container.Spacing.Trailing
        };
    end, 
    getDropdownMenuCellDefaultTokens = function(v3)
        return {
            iconSize = v3.Tokens.Global.Size_450, 
            containerPadding = {
                left = v3.Tokens.Global.Space_200, 
                right = v3.Tokens.Global.Space_300
            }, 
            textFont = v3.Tokens.Semantic.Typography.Subheader, 
            iconTextSpacing = v3.Tokens.Global.Space_200, 
            border = {
                cornerRadius = v3.Tokens.Semantic.Radius.Medium, 
                size = v3.Tokens.Global.Stroke_100
            }
        };
    end, 
    getDropdownMenuDefaultTokens = function(v4)
        return {
            height = UDim.new(0, v4.Tokens.Global.Size_600), 
            menuStateColors = {
                buttonDefault = {
                    Color = v4.Tokens.Semantic.Color.Action.Secondary.Border.Color3, 
                    Transparency = v4.Tokens.Semantic.Color.Action.Secondary.Border.Transparency
                }, 
                contentDefault = {
                    Color = v4.Tokens.Semantic.Color.Text.Default.Color3, 
                    Transparency = v4.Tokens.Semantic.Color.Text.Default.Transparency
                }, 
                alert = {
                    Color = v4.Tokens.Semantic.Color.Action.Alert.Border.Color3, 
                    Transparency = v4.Tokens.Semantic.Color.Action.Alert.Border.Transparency
                }
            }
        };
    end
};
