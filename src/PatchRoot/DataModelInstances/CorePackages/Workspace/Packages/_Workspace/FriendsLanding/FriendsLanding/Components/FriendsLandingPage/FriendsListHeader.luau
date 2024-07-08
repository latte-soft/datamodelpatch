local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useStyle_0 = v1.UIBlox.Core.Style.useStyle;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_TenFootUiGridCarouselHeader_0 = require(l_Parent_0.TenFootUiSharedComponents).TenFootUiGridCarouselHeader;
local v6 = require(l_Parent_0.React);
return function(v7)
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v7.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_useStyle_0().Tokens.Global.Space_500)
        }), 
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        GridHeader = v6.createElement(l_TenFootUiGridCarouselHeader_0, {
            text = ("%* (%*)"):format(l_useLocalization_0({
                friends = "CommonUI.Features.Label.Friends"
            }).friends, (tostring(v7.friendCount or 0)))
        })
    });
end;
