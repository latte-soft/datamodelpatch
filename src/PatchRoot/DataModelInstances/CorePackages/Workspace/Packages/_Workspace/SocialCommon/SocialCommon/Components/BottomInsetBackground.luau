local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.RoactUtils);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
return function()
    local v6 = l_useStyle_0();
    return v1.createElement("Frame", {
        BackgroundColor3 = v6.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v6.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = UDim2.new(1, 0, 0, (l_useSelector_0(function(v7)
            if not v7.GlobalGuiInset then
                return 0;
            else
                return v7.GlobalGuiInset.bottom;
            end;
        end))), 
        ZIndex = 3
    });
end;
