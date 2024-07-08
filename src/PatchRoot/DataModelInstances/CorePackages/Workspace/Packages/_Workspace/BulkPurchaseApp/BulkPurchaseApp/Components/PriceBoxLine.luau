local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v5 = require(script.Parent.LineItemLayout);
local v6 = require(script.Parent.Price);
local v7 = require(l_script_FirstAncestor_0.Enums.PriceBoxLineVariantEnum);
return function(v8)
    local v9 = l_useDesignTokens_0();
    local v10 = if v8.variant == v7.Danger then {
        LineHeight = v9.Semantic.Typography.Body.LineHeight, 
        Font = v9.Semantic.Typography.Subheader.Font, 
        FontSize = v9.Semantic.Typography.Body.FontSize, 
        LetterSpacing = v9.Semantic.Typography.Body.LetterSpacing
    } else v9.Semantic.Typography.Body;
    local l_Default_0 = v9.Semantic.Color.Text.Default;
    if v8.variant == v7.Highlight then
        l_Default_0 = v9.Semantic.Color.Text.Emphasis;
    elseif v8.variant == v7.Danger then
        l_Default_0 = v9.Semantic.Color.Common.Alert;
    end;
    return v2.createElement(v5, {
        LayoutOrder = v8.LayoutOrder, 
        startSlot = v2.createElement(l_StyledTextLabel_0, {
            fontStyle = v10, 
            colorStyle = l_Default_0, 
            text = v8.text
        }), 
        endSlot = v2.createElement(v6, {
            colorStyle = l_Default_0, 
            fontStyle = v10, 
            amount = v8.amount
        })
    });
end;
