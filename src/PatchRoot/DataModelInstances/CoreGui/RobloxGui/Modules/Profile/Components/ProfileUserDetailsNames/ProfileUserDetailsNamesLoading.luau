local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_LoadingSkeleton_0 = v0.LoadingSkeleton;
local l_useStyle_0 = v0.UIBlox.Core.Style.useStyle;
return function()
    local l_Font_0 = l_useStyle_0().Font;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Skeleton = l_Roact_0.createElement(l_LoadingSkeleton_0, {
            Size = UDim2.new(1, 0, 0, 0), 
            createLayout = function()
                return l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 1)
                });
            end, 
            panels = {
                {
                    Size = UDim2.new(0.4, 0, 0, l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize)
                }, 
                {
                    Size = UDim2.new(0.3, 0, 0, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize)
                }
            }
        })
    });
end;
