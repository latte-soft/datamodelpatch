local _ = require(game:GetService("CorePackages").Workspace.Packages.Style);
return function(_, v2)
    local l_Size_250_0 = v2.Global.Size_250;
    local v4 = v2.Global.Space_200 + l_Size_250_0;
    local v5 = l_Size_250_0 + v2.Global.Space_100;
    local l_Size_600_0 = v2.Global.Size_600;
    local l_Size_600_1 = v2.Global.Size_600;
    local l_Space_150_0 = v2.Global.Space_150;
    return {
        SearchHeadingScale = 0.8, 
        SearchPaddingHorizontal = v2.Global.Space_300, 
        SearchPaddingVertical = 85, 
        SearchBoxHeight = l_Size_600_0, 
        SearchBoxTextSize = v2.Global.FontSize_200, 
        SearchBoxIconSize = l_Size_250_0, 
        SearchBoxIconPosition = v5, 
        SearchBoxIconPaddingLeft = v4, 
        SearchBoxIconPaddingRight = v2.Global.Space_200, 
        SearchBoxIconPaddingVertical = v2.Global.Space_100, 
        SearchTypePaddingVertical = l_Space_150_0, 
        SearchTypeHeight = l_Size_600_1, 
        SearchBoxAndTypeOffset = ((85 + l_Size_600_0) + l_Size_600_1) + l_Space_150_0 * 2
    };
end;
