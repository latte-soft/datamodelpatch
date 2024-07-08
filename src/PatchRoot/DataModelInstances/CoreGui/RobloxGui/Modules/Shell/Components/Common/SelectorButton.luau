local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.Shell.Components.Common.RoundedButton);
local v5 = v1.PureComponent:extend("SelectorButton");
v5.init = function(v6)
    v6.key = v6.props.StringKey;
    v6.onSelectionGained = function()
        if v6.props.OnSelectionGained then
            v6.props.OnSelectionGained(v6.key);
        end;
    end;
    v6.onSelectionLost = function()
        if v6.props.OnSelectionLost then
            v6.props.OnSelectionLost(v6.key);
        end;
    end;
    v6.onActivated = function()
        if v6.props.OnActivated then
            v6.props.OnActivated(v6.key);
        end;
    end;
end;
v5.render = function(v7)
    local v8 = {};
    local v9 = {};
    local l_Size_0 = v7.props.Size;
    local l_Position_0 = v7.props.Position;
    local l_AnchorPoint_0 = v7.props.AnchorPoint;
    local l_Focused_0 = v7.props.Focused;
    local l_Disabled_0 = v7.props.Disabled;
    local l_Selected_0 = v7.props.Selected;
    v7.layoutOrder = v7.props.LayoutOrder;
    v8.Size = UDim2.new(1, 0, 1, 0);
    v8.AnchorPoint = Vector2.new(0.5, 0.5);
    v8.Position = UDim2.new(0.5, 0, 0.5, 0);
    v9.Text = v7.props.Text;
    v9.Size = UDim2.new(1, 0, 1, 0);
    v9.AnchorPoint = Vector2.new(0, 0.5);
    v9.Position = UDim2.new(0, 24, 0.5, 0);
    local v16 = v1.createElement(v4, {
        Button = v8, 
        Text = v9, 
        Focused = l_Focused_0, 
        Disabled = l_Disabled_0, 
        Selected = l_Selected_0, 
        OnSelectionGained = v7.onSelectionGained, 
        OnSelectionLost = v7.onSelectionLost, 
        OnActivated = v7.onActivated
    });
    local v17 = nil;
    if l_Focused_0 == true then
        v17 = v1.createElement("ImageLabel", {
            Size = UDim2.new(0, 15, 0, 30), 
            Image = v3.Images.RightArrow, 
            Position = UDim2.new(1, 14, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1
        });
    end;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = v7.layoutOrder, 
        BackgroundTransparency = 1
    }, v2.JoinDictionaries({
        Button = v16, 
        Selector = v17
    }, v7.props[v1.Children] or {}));
end;
return v5;
