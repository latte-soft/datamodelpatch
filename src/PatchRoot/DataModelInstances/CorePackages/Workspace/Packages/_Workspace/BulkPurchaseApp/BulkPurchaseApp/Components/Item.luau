local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(script.Parent.Box);
local function v8(v5)
    local l_Size_600_0 = v5.Global.Size_600;
    local l_Space_100_0 = v5.Global.Space_100;
    return {
        fontStyle = v5.Semantic.Typography.Body, 
        colorStyle = v5.Semantic.Color.Text.Default, 
        imageRightMargin = v5.Global.Space_150, 
        imageBoxSize = l_Size_600_0, 
        imageBoxPadding = l_Space_100_0, 
        imageBoxTransparency = v5.Semantic.Color.Common.Placeholder.Transparency, 
        imageBoxBackgroundColor = v5.Semantic.Color.Common.Placeholder.Color3, 
        imageBoxCornerRadius = v5.Semantic.Radius.Medium, 
        imageSize = l_Size_600_0 - l_Space_100_0 * 2
    };
end;
return function(v9)
    local v10 = l_useDesignTokens_0(v8);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v10.imageBoxSize), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v9.LayoutOrder
    }, {
        ImageBox = v1.createElement(v4, {
            Size = UDim2.fromOffset(v10.imageBoxSize, v10.imageBoxSize), 
            BorderSizePixel = 0, 
            BackgroundTransparency = v10.imageBoxTransparency, 
            BackgroundColor3 = v10.imageBoxBackgroundColor, 
            padding = {
                v10.imageBoxPadding, 
                v10.imageBoxPadding, 
                v10.imageBoxPadding, 
                v10.imageBoxPadding
            }, 
            cornerRadius = UDim.new(0, v10.imageBoxCornerRadius)
        }, {
            Image = v1.createElement("ImageLabel", {
                Image = v9.image, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v10.imageSize, v10.imageSize), 
                [v1.Tag] = "data-testid=BulkPurchaseApp_ItemImage"
            })
        }), 
        LineItem = v1.createElement("Frame", {
            Position = UDim2.fromOffset(v10.imageBoxSize + v10.imageRightMargin, 0), 
            Size = UDim2.new(1, -(v10.imageBoxSize + v10.imageRightMargin), 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v1.createElement(l_StyledTextLabel_0, {
            fontStyle = v10.fontStyle, 
            colorStyle = v10.colorStyle, 
            text = v9.name, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textYAlignment = Enum.TextYAlignment.Top, 
            size = UDim2.new(0.66, 0, 1, 0), 
            lineHeight = v10.fontStyle.lineHeight
        }), v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0.33, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0, 0)
        }, v9.endSlot))
    });
end;
