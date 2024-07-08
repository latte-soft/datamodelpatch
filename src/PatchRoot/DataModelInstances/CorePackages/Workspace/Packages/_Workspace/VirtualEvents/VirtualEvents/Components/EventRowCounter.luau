local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Common.formatNumberWithShortUnits);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = {
    iconSize = Vector2.new(18, 18), 
    padding = UDim.new(0, 4)
};
return function(v9)
    local v10 = v1.Dictionary.join(v8, v9);
    local v11 = l_useStyle_0();
    if v10.counter == 0 then
        return nil;
    else
        return v2.createElement("Frame", {
            LayoutOrder = v10.layoutOrder, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = v10.padding
            }), 
            Icon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v10.iconSize.X, v10.iconSize.Y), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = v10.icon, 
                BackgroundTransparency = 1, 
                ImageColor3 = v11.Theme.TextDefault.Color, 
                ImageTransparency = v11.Theme.TextDefault.Transparency
            }), 
            Count = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                text = v4(v10.counter), 
                automaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v11.Font.CaptionBody, 
                colorStyle = v11.Theme.TextDefault
            })
        });
    end;
end;
