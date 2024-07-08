local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Style.StyleTypes);
local _ = require(l_Parent_0.Style.Fonts);
return {
    getDefaultStyleProps = function(v3)
        assert(v3.Tokens ~= nil, "Design token support is not enabled");
        return {
            backgroundColor = {
                Color = v3.Tokens.Component.VerticalTile.Base.Container.Background.Color3, 
                Transparency = v3.Tokens.Component.VerticalTile.Base.Container.Background.Transparency
            }, 
            border = {
                BorderColor = {
                    Color = v3.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3, 
                    Transparency = v3.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
                }, 
                CornerRadius = UDim.new(0, v3.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop), 
                Width = v3.Tokens.Component.VerticalTile.Base.Container.BorderWidth
            }, 
            topContentPadding = {
                Left = v3.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Leading, 
                Right = v3.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Trailing, 
                Top = v3.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Top, 
                Bottom = v3.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Bottom
            }, 
            bottomContentPadding = {
                Left = v3.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Leading, 
                Right = v3.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Trailing, 
                Top = v3.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                Bottom = v3.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
            }, 
            overlayColors = {}, 
            selectionCursorPadding = {
                Left = 0, 
                Right = 0, 
                Top = 0, 
                Bottom = 0
            }, 
            dropShadow = {
                Position = UDim2.new(0.5, 0, 0.5, 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 10, 1, 12), 
                ImageColor = {
                    Color = v3.Tokens.Semantic.Color.Common.DropShadow.Color3, 
                    Transparency = v3.Tokens.Semantic.Color.Common.DropShadow.Transparency
                }, 
                ImageAssetName = "component_assets/dropshadow_24_6", 
                SliceCenter = Rect.new(18, 18, 18, 18)
            }, 
            contentTitlePadding = v3.Tokens.Global.Space_100, 
            contentTitleFont = v3.Font.Header2
        };
    end, 
    DEFAULT_FOOTER_HEIGHT = 22, 
    DEFAULT_TEXT_LINE_COUNT = 2
};
