local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v4 = require(script.Parent.LineItemLayout);
return function(v5)
    local v6 = l_useDesignTokens_0();
    local v7 = {
        LineHeight = v6.Semantic.Typography.Body.LineHeight, 
        Font = v6.Semantic.Typography.Subheader.Font, 
        FontSize = v6.Semantic.Typography.Body.FontSize, 
        LetterSpacing = v6.Semantic.Typography.Body.LetterSpacing
    };
    local l_Emphasis_0 = v6.Semantic.Color.Text.Emphasis;
    return v1.createElement(v4, {
        startSlot = v1.createElement(l_StyledTextLabel_0, {
            fontStyle = v7, 
            colorStyle = l_Emphasis_0, 
            text = v5.heading
        }), 
        endSlot = v1.createElement(l_StyledTextLabel_0, {
            fontStyle = v7, 
            colorStyle = l_Emphasis_0, 
            text = v5.itemCount
        }), 
        LayoutOrder = v5.LayoutOrder
    });
end;
