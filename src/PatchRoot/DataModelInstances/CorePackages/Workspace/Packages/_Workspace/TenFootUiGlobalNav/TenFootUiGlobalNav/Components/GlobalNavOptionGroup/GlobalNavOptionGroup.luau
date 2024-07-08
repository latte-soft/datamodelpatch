local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.GlobalNavOption);
local v5 = require(script.Parent.GlobalNavOptionTooltip);
local v6 = require(l_script_FirstAncestor_0.Components.utils.eraseKeys);
local function v14(v7, v8)
    return v3.List.foldLeft(v3.List.filter(v7:GetDescendants(), function(v9, _)
        return v9:IsA("ImageButton");
    end), function(v11, v12, v13)
        v11[v12] = if not v8[v13] then nil else v8[v13].label;
        return v11;
    end, {});
end;
local function v19(v15, v16, v17)
    local v18 = v17[v15];
    if not v18 then
        return nil;
    else
        return {
            label = v18, 
            xOffset = (v15.AbsolutePosition.X - v16.AbsolutePosition.X) + v15.Size.X.Offset / 2, 
            yOffset = (v15.Position.Y.Offset + v15.Size.Y.Offset) - 10
        };
    end;
end;
return function(v20)
    local v21, v22 = v2.useState(nil);
    return v2.createElement("Frame", v3.Dictionary.join({
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, (v6({
        "items", 
        "spacing"
    }, v20))), v2.createElement("Frame", {
        Name = "Options", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v2.Event.SelectionChanged] = function(v23, _, _, v26)
            v22((v19(v26, v23, (v14(v23, v20.items)))));
        end
    }, v2.createElement("UIListLayout", {
        key = "globalNavOptionGroupLayout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, v20.spacing or 0)
    }), table.unpack((v3.List.map(v20.items, function(v27, v28)
        return v2.createElement(v4, {
            key = v27.label .. "-" .. v28, 
            icon = v27.icon, 
            onActivated = v27.onActivated
        });
    end)))), if not v21 then nil else v2.createElement(v5, v21));
end;
