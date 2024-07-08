local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.ImageSet.ImagesTypes);
local v4 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v5 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v6 = require(l_script_FirstAncestor_0.Indicator.StatWidget);
local _ = require(l_script_FirstAncestor_0.Style.Fonts);
local v8 = require(l_Parent_0.Core.Style.useStyle);
local v9 = require(l_Parent_0.Core.Text.GetTextSize);
local v10 = v5(v4.Large);
local function _(v11, v12, v13)
    return v9(v11, v12.RelativeSize * v13.Font.BaseSize, v12.Font, (Vector2.new(10000, 10000))).X;
end;
local function _(v15, v16)
    local l_countText_0 = v15.countText;
    local l_Title_0 = v16.Font.Title;
    local l_X_0 = v9(l_countText_0, l_Title_0.RelativeSize * v16.Font.BaseSize, l_Title_0.Font, (Vector2.new(10000, 10000))).X;
    l_Title_0 = v15.labelText;
    local l_CaptionHeader_0 = v16.Font.CaptionHeader;
    return (math.max(l_X_0, v9(l_Title_0, l_CaptionHeader_0.RelativeSize * v16.Font.BaseSize, l_CaptionHeader_0.Font, (Vector2.new(10000, 10000))).X) + v10) + 12;
end;
return function(v22)
    local v23 = v8();
    local l_countLeft_0 = v22.countLeft;
    local l_countText_1 = l_countLeft_0.countText;
    local l_Title_1 = v23.Font.Title;
    local l_X_1 = v9(l_countText_1, l_Title_1.RelativeSize * v23.Font.BaseSize, l_Title_1.Font, (Vector2.new(10000, 10000))).X;
    l_Title_1 = l_countLeft_0.labelText;
    local l_CaptionHeader_1 = v23.Font.CaptionHeader;
    local v29 = (math.max(l_X_1, v9(l_Title_1, l_CaptionHeader_1.RelativeSize * v23.Font.BaseSize, l_CaptionHeader_1.Font, (Vector2.new(10000, 10000))).X) + v10) + 12;
    l_X_1 = v22.countRight;
    l_Title_1 = l_X_1.countText;
    l_CaptionHeader_1 = v23.Font.Title;
    l_countText_1 = v9(l_Title_1, l_CaptionHeader_1.RelativeSize * v23.Font.BaseSize, l_CaptionHeader_1.Font, (Vector2.new(10000, 10000))).X;
    l_CaptionHeader_1 = l_X_1.labelText;
    local l_CaptionHeader_2 = v23.Font.CaptionHeader;
    l_X_1 = v29 / (v29 + ((math.max(l_countText_1, v9(l_CaptionHeader_1, l_CaptionHeader_2.RelativeSize * v23.Font.BaseSize, l_CaptionHeader_2.Font, (Vector2.new(10000, 10000))).X) + v10) + 12));
    l_countText_1 = 1 - l_X_1;
    l_Title_1 = v22.countLeft;
    l_CaptionHeader_1 = v22.countRight;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v22.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        LeftSection = v2.createElement(v6, {
            countText = l_Title_1.countText, 
            labelText = l_Title_1.labelText, 
            icon = l_Title_1.icon, 
            layoutOrder = 1, 
            position = UDim2.new(0, 0, 0, 0), 
            anchorPoint = Vector2.new(0, 0), 
            size = UDim2.new(l_X_1, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        RightSection = v2.createElement(v6, {
            countText = l_CaptionHeader_1.countText, 
            labelText = l_CaptionHeader_1.labelText, 
            icon = l_CaptionHeader_1.icon, 
            layoutOrder = 2, 
            position = UDim2.new(1, 0, 0, 0), 
            anchorPoint = Vector2.new(1, 0), 
            size = UDim2.new(l_countText_1, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Right
        })
    });
end;
