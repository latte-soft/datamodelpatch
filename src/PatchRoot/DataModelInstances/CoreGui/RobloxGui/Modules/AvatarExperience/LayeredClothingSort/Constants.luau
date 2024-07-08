local l_GuiService_0 = game:GetService("GuiService");
local v1 = not require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild() and 1 or 1.3;
return not not l_GuiService_0:IsTenFootInterface() and {
    Tile = {
        Size = 80, 
        SelectedSize = 88, 
        Padding = 6, 
        ContextWidth = 64, 
        ShownContextWidth = 51, 
        MoreIconSize = 52, 
        ArrowSize = UDim2.fromOffset(42, 33)
    }, 
    VerticalList = {
        Width = 92, 
        HeightScale = 0.8
    }, 
    NoItem = {
        TextSize = 20, 
        BottomPadding = -72, 
        IconSize = 48
    }, 
    LongPressSeconds = 0.0625, 
    RightMargin = 80
} or {
    Tile = {
        Size = 50 * v1, 
        SelectedSize = 58 * v1, 
        Padding = 6 * v1, 
        ContextWidth = 42 * v1, 
        ShownContextWidth = 33 * v1, 
        MoreIconSize = 34 * v1, 
        ArrowSize = UDim2.fromOffset(28, 22)
    }, 
    VerticalList = {
        Width = 62 * v1, 
        HeightScale = 0.8
    }, 
    NoItem = {
        TextSize = 12, 
        BottomPadding = 0, 
        IconSize = 30
    }, 
    LongPressSeconds = 0.25, 
    RightMargin = 12
};
