local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Style.StyleTypes);
local _ = require(l_Parent_0.Style.Fonts);
return {
    getDefaultStyleProps = function(v3)
        return {
            borderRadius = UDim.new(0, v3.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop), 
            contentGap = v3.Tokens.Global.Space_150, 
            gutter = v3.Tokens.Global.Space_300, 
            titleFont = v3.Font.Header1, 
            titleTextColor = {
                Color = v3.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                Transparency = v3.Tokens.Semantic.Color.Text.Emphasis.Transparency
            }
        };
    end
};
