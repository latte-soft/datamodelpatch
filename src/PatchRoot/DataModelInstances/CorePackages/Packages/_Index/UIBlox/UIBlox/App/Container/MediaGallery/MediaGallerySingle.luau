local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local v1 = require(l_script_FirstAncestor_0.UIBloxConfig);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Otter);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = {
    itemAspectRatio = 1.7777777777777777, 
    itemPadding = 16, 
    dragIntent = 20, 
    borderRadius = UDim.new(0, 8), 
    spring = v3.spring
};
return function(v6)
    local v7 = v2.Dictionary.join(v5, v6);
    local v8, v9 = v4.useState(Vector2.new(0, 0));
    local v10, v11 = v4.useState(Vector2.new(0, 0));
    local v12 = v4.useRef(nil);
    local v13 = v4.useRef(nil);
    local v14 = v4.useRef(0);
    local v15 = v4.useRef(false);
    local v16 = v4.useRef(1);
    local v17 = nil;
    if not v1.updateMediaGallerySingle then
        v17 = 1 + math.round(v10.X / (v8.X + v7.itemPadding));
    end;
    local v19 = v4.useCallback(function(v18)
        if v18 == "Right" then
            return v17 + 1;
        else
            return v17 - 1;
        end;
    end);
    local v21 = v4.useCallback(function(v20)
        return Vector2.new((v8.X + v7.itemPadding) * (v20 - 1), 0);
    end);
    local v26 = v4.useCallback(function(v22)
        v15.current = true;
        local v23 = v3.createSingleMotor(0);
        local v24 = v21(v22);
        v23:onStep(function(v25)
            v11(v10:Lerp(v24, v25));
        end);
        v23:onComplete(function()
            v15.current = false;
        end);
        v23:setGoal(v7.spring(1, {
            frequency = 3, 
            dampingRatio = 1, 
            restingVelocityLimit = 0.05
        }));
    end);
    local v32 = v4.useCallback(function(v27)
        local v28 = nil;
        v28 = if v27 == "Right" then v16.current + 1 else v16.current - 1;
        if (v28 >= 1 and v28 <= #v7.items) and v7.dragIntent <= math.abs(v14.current) then
            v16.current = v28;
        end;
        local v29 = Vector2.new((v8.X + v7.itemPadding) * (v16.current - 1), 0);
        v15.current = true;
        local v30 = v3.createSingleMotor(0);
        v30:onStep(function(v31)
            v11(v10:Lerp(v29, v31));
        end);
        v30:onComplete(function()
            v15.current = false;
        end);
        v30:setGoal(v7.spring(1, {
            frequency = 3, 
            dampingRatio = 1, 
            restingVelocityLimit = 0.05
        }));
    end);
    local v35 = v4.useCallback(function(_, v34)
        if not v15.current then
            if not (v34.UserInputType ~= Enum.UserInputType.MouseButton1) or v34.UserInputType == Enum.UserInputType.Touch then
                v12.current = v34;
            end;
            return ;
        else
            return ;
        end;
    end);
    local v41 = v4.useCallback(function(_, v37)
        if not (not v12.current or v15.current) and (not (v37.UserInputType ~= Enum.UserInputType.MouseMovement) or v37.UserInputType == Enum.UserInputType.Touch) then
            if not v13.current then
                v13.current = v37.Position;
            end;
            local v38 = v13.current - v37.Position;
            if v38 ~= Vector3.zero then
                local l_v14_0 = v14;
                l_v14_0.current = l_v14_0.current + v38.x;
                v11(function(v40)
                    return Vector2.new(math.clamp(v40.X + v38.X, 0, math.huge), 0);
                end);
            end;
            v13.current = v37.Position;
        end;
    end);
    local v46 = v4.useCallback(function(_, v43)
        if v43 == v12.current then
            v12.current = nil;
            v13.current = nil;
            local v44 = v14.current > 1 and "Right" or "Left";
            if not v1.updateMediaGallerySingle then
                local v45 = v19(v44);
                if v45 >= 1 and v45 <= #v7.items then
                    if v7.dragIntent <= math.abs(v14.current) then
                        v26(v45);
                    else
                        v26(v17);
                    end;
                end;
            else
                v32(v44);
            end;
            v14.current = 0;
        end;
    end);
    local v47, v48 = v4.useState(math.huge);
    local v50 = v4.useCallback(function(v49)
        v9(v49.AbsoluteSize);
        v48(v49.AbsoluteSize.X / v7.itemAspectRatio);
    end, {
        v7.itemAspectRatio
    });
    local v51 = {};
    for v52, v53 in v7.items, nil, nil do
        v51["Item" .. v52] = v4.createElement("ImageLabel", {
            LayoutOrder = v52, 
            Size = UDim2.new(1, 0, 0, v47), 
            Image = v53.imageId, 
            ScaleType = Enum.ScaleType.Crop
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = v7.borderRadius
            })
        });
    end;
    return v4.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = v10, 
        ScrollingEnabled = false, 
        ScrollBarImageTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ClipsDescendants = false, 
        [v4.Change.AbsoluteSize] = v50, 
        [v4.Event.InputBegan] = v35, 
        [v4.Event.InputChanged] = v41, 
        [v4.Event.InputEnded] = v46
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v7.itemPadding)
        }), 
        Items = v4.createElement(v4.Fragment, {}, v51)
    });
end;
