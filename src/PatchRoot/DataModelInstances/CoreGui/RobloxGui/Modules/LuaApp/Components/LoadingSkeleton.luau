local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.FitChildren);
local v3 = require(l_Modules_0.LuaApp.Components.ShimmerPanel);
local v4 = v1.PureComponent:extend("LoadingSkeleton");
v4.render = function(v5)
    local l_Size_0 = v5.props.Size;
    local l_Position_0 = v5.props.Position;
    local l_AnchorPoint_0 = v5.props.AnchorPoint;
    local l_LayoutOrder_0 = v5.props.LayoutOrder;
    local l_panels_0 = v5.props.panels;
    local l_createLayout_0 = v5.props.createLayout;
    local v12 = {};
    if l_createLayout_0 then
        v12.Layout = l_createLayout_0();
    end;
    for v13, v14 in ipairs(l_panels_0) do
        v12[v13] = v1.createElement(v3, {
            Size = v14.Size, 
            Position = v14.Position, 
            LayoutOrder = v13
        });
    end;
    if not l_Size_0 then
        return v1.createElement(v2.FitFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            fitAxis = v2.FitAxis.Both
        }, v12);
    else
        return v1.createElement("Frame", {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1
        }, v12);
    end;
end;
return v4;
