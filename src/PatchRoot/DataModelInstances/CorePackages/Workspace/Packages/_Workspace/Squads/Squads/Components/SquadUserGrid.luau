local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_Roact_0 = v1.Roact;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v6 = require(l_script_FirstAncestor_0.Components.SquadUserCard);
return function(v7)
    local v11 = l_React_0.useMemo(function()
        local v8 = math.clamp(math.ceil(#v7.users / 2), 2, 3);
        local v9 = (v7.containerSize.Y - 12 * (v8 - 1)) / v8;
        local v10 = v7.containerSize.X - 32;
        return Vector2.new(if #v7.users < 3 then v10 else (v10 - 12) / 2, v9);
    end, l_dependencyArray_0(v7.containerSize, #v7.users));
    local v15 = l_React_0.useMemo(function()
        local v12 = {};
        for v13, v14 in ipairs(v7.users) do
            v12["UserCard" .. v13] = l_Roact_0.createElement(v6, {
                containerWidth = v11.X, 
                isBlocked = false, 
                layoutOrder = v14.rank, 
                user = v14
            });
        end;
        return v12;
    end, l_dependencyArray_0(v11, v7.users));
    v15.UIGridLayout = l_React_0.createElement("UIGridLayout", {
        CellPadding = UDim2.fromOffset(12, 12), 
        CellSize = UDim2.fromOffset(v11.X, v11.Y), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    });
    v15.UIPadding = l_React_0.createElement("UIPadding", {
        PaddingBottom = v7.paddingBottom, 
        PaddingLeft = UDim.new(0, 16), 
        PaddingRight = UDim.new(0, 16)
    });
    return l_Roact_0.createFragment(v15);
end;
