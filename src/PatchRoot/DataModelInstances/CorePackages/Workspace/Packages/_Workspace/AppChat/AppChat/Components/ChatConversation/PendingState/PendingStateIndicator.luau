local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v10 = {
    bodyText = "Placeholder body", 
    iconImage = l_Images_0["icons/status/oof_xlarge"], 
    size = UDim2.new(1, 0, 1, 0)
};
return l_memo_0(function(v11)
    local v12 = v3.Dictionary.join(v10, v11);
    local v13 = v12.style or l_useStyle_0();
    local l_Size_1200_0 = v13.Tokens.Global.Size_1200;
    return v4.createElement("Frame", {
        BackgroundColor3 = v13.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = v12.size, 
        Transparency = v13.Theme.BackgroundDefault.Transparency, 
        LayoutOrder = v12.layoutOrder
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v13.Tokens.Global.Space_150), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        IconAndTextFrame = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v13.Tokens.Global.Space_150), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            OofIcon = v4.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v12.iconImage, 
                ImageColor3 = v13.Theme.IconDefault.Color, 
                ImageTransparency = v13.Theme.IconDefault.Transparency, 
                Size = UDim2.new(0, l_Size_1200_0, 0, l_Size_1200_0)
            }), 
            BodyText = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v13.Font.Body.Font, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v12.bodyText, 
                TextSize = v13.Font.Body.RelativeSize * v13.Font.BaseSize, 
                TextColor3 = v13.Theme.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y
            })
        })
    });
end);
