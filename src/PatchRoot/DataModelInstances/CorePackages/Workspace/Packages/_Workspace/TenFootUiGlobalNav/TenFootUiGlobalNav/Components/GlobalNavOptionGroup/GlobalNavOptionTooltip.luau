local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local v5 = game:DefineFastFlag("TenFootUiGlobalNavFixOptionText", false);
return function(v6)
    local v7 = l_useStyle_0();
    return v1.createElement("Frame", {
        Transparency = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 300, 1, 0), 
        AnchorPoint = Vector2.new(0.5, -1), 
        Position = UDim2.new(0, v6.xOffset, 0, v6.yOffset)
    }, v1.createElement(l_StyledTextLabel_0, {
        size = UDim2.new(1, 0, 1, 0), 
        text = v6.label, 
        textXAlignment = Enum.TextXAlignment.Center, 
        colorStyle = {
            Color = v7.Theme.TextDefault.Color, 
            Transparency = 0
        }, 
        fontStyle = if not v5 then v7.Font.Header2 else v7.Tokens.Semantic.Typography.Body
    }));
end;
