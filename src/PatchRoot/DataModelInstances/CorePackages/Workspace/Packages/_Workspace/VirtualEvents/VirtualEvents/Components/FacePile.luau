local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = UDim.new(0, 12);
return function(v4)
    local v5 = {};
    for v8, v9 in (v2.useMemo(function()
        if v4.desiredFirstUserId then
            local v6 = v1.List.find(v4.userIds, v4.desiredFirstUserId);
            if v6 then
                local v7 = table.clone(v4.userIds);
                table.remove(v7, v6);
                table.insert(v7, 1, v4.desiredFirstUserId);
                return v7;
            end;
        end;
        return v4.userIds;
    end, {
        v4.userIds, 
        v4.desiredFirstUserId
    })), nil, nil do
        v5[v9] = v2.createElement("ImageLabel", {
            LayoutOrder = v8, 
            BackgroundColor3 = Color3.fromRGB(209, 209, 209), 
            Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(v9), 
            Size = UDim2.fromOffset(36, 36)
        }, {
            BorderRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        });
    end;
    return v2.createElement("Frame", {
        LayoutOrder = v4.layoutOrder, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v3
        }), 
        Faces = v2.createElement(v2.Fragment, nil, v5)
    });
end;
