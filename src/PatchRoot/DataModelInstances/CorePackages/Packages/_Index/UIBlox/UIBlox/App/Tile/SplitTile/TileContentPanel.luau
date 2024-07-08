local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local v2 = require(l_Parent_0.Parent.React);
local v3 = require(l_Core_0.Style.useStyle);
local _ = require(l_Parent_0.App.Style.Fonts);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local v6 = require(l_Parent_0.Utility.setDefault);
local v7 = require(l_Parent_0.UIBloxConfig);
return function(v8)
    local v9 = v3();
    local v10 = not v9.Settings.ReducedMotion and 8 or 6;
    local l_contentTitle_0 = v8.contentTitle;
    local l_contentFooter_0 = v8.contentFooter;
    local v13 = v6(v8.textLineCount, 2);
    local v14 = v6(v8.hasSidePadding, true);
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    if not (v8.outerPadding ~= nil) or type(v8.outerPadding) == "number" then
        local v19 = v6(v8.outerPadding, v10);
        v15 = v19;
        v16 = v19;
        v17 = v19;
        v18 = v19;
    else
        v15 = v6(v8.outerPadding.Left, v10);
        v16 = v6(v8.outerPadding.Right, v10);
        v17 = v6(v8.outerPadding.Top, v10);
        v18 = v6(v8.outerPadding.Bottom, v10);
    end;
    local v20 = v6(v8.titlePadding, v10);
    local l_panelHeight_0 = v8.panelHeight;
    local l_footerHeight_0 = v8.footerHeight;
    local l_Font_0 = v9.Font;
    local v24 = v6(v8.titleFont, l_Font_0.Header2);
    local l_Theme_0 = v9.Theme;
    local v26 = (l_Font_0.BaseSize * v24.RelativeSize) * v13;
    local v27 = if not v7.useNewThemeColorPalettes then l_Theme_0.TextEmphasis else l_Theme_0.TextDefault;
    return v2.createElement("Frame", {
        Size = UDim2.new(UDim.new(1, 0), l_panelHeight_0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v20)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = if not v14 then nil else UDim.new(0, v15), 
            PaddingRight = if not v14 then nil else UDim.new(0, v16), 
            PaddingTop = UDim.new(0, v17), 
            PaddingBottom = UDim.new(0, v18)
        }), 
        TitleText = if (v13 > 0 and l_contentTitle_0) and string.len(l_contentTitle_0) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = l_contentTitle_0, 
            Font = v24.Font, 
            TextSize = l_Font_0.BaseSize * v24.RelativeSize, 
            TextTransparency = v27.Transparency, 
            TextColor3 = v27.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(math.huge, v26)
            })
        }) else nil, 
        ContentFooter = if not l_contentFooter_0 then nil else v2.createElement("Frame", {
            Size = UDim2.new(UDim.new(1, 0), l_footerHeight_0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            l_contentFooter_0
        })
    });
end;
