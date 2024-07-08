local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Constants);
local _ = v3.DefaultFontSize.MainWindow;
local _ = v3.Color.Text;
local _ = v3.Font.MainWindow;
local _ = v3.Font.MainWindowBold;
local l_CheckBoxHeight_0 = v3.UtilityBarFormatting.CheckBoxHeight;
local _ = v3.UtilityBarFormatting.CheckBoxInnerPadding;
return function(v10)
    local l_isSelected_0 = v10.isSelected;
    local l_size_0 = v10.size;
    local l_pos_0 = v10.pos;
    local l_LayoutOrder_0 = v10.LayoutOrder;
    local l_SelectedBlue_0 = v3.Color.SelectedBlue;
    local l_UnselectedGray_0 = v3.Color.UnselectedGray;
    local v17 = "";
    local v18 = 1;
    local l_l_UnselectedGray_0_0 = l_UnselectedGray_0;
    if l_isSelected_0 then
        v17 = v3.Image.Check;
        v18 = 0;
        l_l_UnselectedGray_0_0 = l_SelectedBlue_0;
    end;
    return v2.createElement("ImageButton", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v2.Event.Activated] = v1.useCallback(function()
            v10.OnCheckBoxClicked(v10.name, not l_isSelected_0);
        end, {
            v10.OnCheckBoxClicked, 
            v10.name, 
            l_isSelected_0
        })
    }, {
        Icon = v2.createElement("ImageLabel", {
            Image = v17, 
            Size = UDim2.new(0, l_CheckBoxHeight_0, 0, l_CheckBoxHeight_0), 
            Position = UDim2.new(0, 0, 0.5, -l_CheckBoxHeight_0 / 2), 
            BackgroundColor3 = l_l_UnselectedGray_0_0, 
            BackgroundTransparency = 0, 
            BorderColor3 = v3.Color.Text, 
            BorderSizePixel = v18
        })
    });
end;
