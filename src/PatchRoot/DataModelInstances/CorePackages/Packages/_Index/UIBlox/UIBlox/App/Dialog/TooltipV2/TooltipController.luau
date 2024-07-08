local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local l_Portal_0 = require(l_Parent_3.Roact).Portal;
local v6 = require(l_Parent_3.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_2.Core.Animation.withAnimation);
local v10 = require(l_Parent_0.TooltipCallout);
local v11 = require(l_Parent_1.Tooltip.Enum.TooltipOrientation);
local function v17(v12, v13)
    local v14 = nil;
    for v15, v16 in pairs(v12) do
        if not v13[v15] and (not (v14 ~= nil) or v12[v14] < v16) then
            v14 = v15;
        end;
    end;
    return v14;
end;
local function v20(v18, v19)
    return {
        [v11.Top] = v18.Y - v8.SCREEN_MARGIN, 
        [v11.Bottom] = (v19.Y - v18.Y) - v8.SCREEN_MARGIN, 
        [v11.Left] = v18.X - v8.SCREEN_MARGIN, 
        [v11.Right] = (v19.X - v18.X) - v8.SCREEN_MARGIN
    };
end;
getOrientationAndContentOffset = function(v21, v22, v23, v24)
    local v25 = {};
    local l_zero_0 = Vector2.zero;
    while true do
        if not (v21 and not v25[v21]) then
            local v27 = v17(v22, v25);
            if v27 then
                v21 = v27;
            else
                break;
            end;
        end;
        if not (v21 ~= v11.Top) or v21 == v11.Bottom then
            if (v23.Y + v8.DISTANCE_TO_CONTENT) + v24.Y <= v22[v21] then
                local l_Left_0 = v11.Left;
                if v22[v11.Right] < v22[v11.Left] then
                    l_Left_0 = v11.Right;
                end;
                local v29 = v22[l_Left_0];
                if v8.MIN_DISTANCE_TO_CARET_MIDDLE <= v29 then
                    l_zero_0 = (-1 * math.max(0, v24.X / 2 - v29)) * v8.ORIENTATION_VECTOR[l_Left_0];
                    break;
                else
                    v25[v8.OPPOSITE_ORIENTATION[v21]] = true;
                end;
            end;
        elseif (v23.X + v8.DISTANCE_TO_CONTENT) + v24.X <= v22[v21] then
            local l_Top_0 = v11.Top;
            if v22[v11.Bottom] < v22[v11.Top] then
                l_Top_0 = v11.Bottom;
            end;
            local v31 = v22[l_Top_0];
            if v8.MIN_DISTANCE_TO_CARET_MIDDLE <= v31 then
                l_zero_0 = (-1 * math.max(0, v24.Y / 2 - v31)) * v8.ORIENTATION_VECTOR[l_Top_0];
                break;
            else
                v25[v8.OPPOSITE_ORIENTATION[v21]] = true;
            end;
        end;
        v25[v21] = true;
        v21 = v8.OPPOSITE_ORIENTATION[v21];
    end;
    return v21, l_zero_0;
end;
return function(v32)
    local v33, v34 = v4.useState(Vector2.zero);
    local v35, v36 = v4.useState(Vector2.zero);
    local v37, v38 = v4.useState(Vector2.zero);
    local v39, v40 = v4.useState(Vector2.zero);
    local v41, v42 = v4.useState(Vector2.zero);
    local v44 = v4.useCallback(function(v43)
        v34(v43.AbsolutePosition);
        v36(v43.AbsoluteSize);
    end);
    local function v46(v45)
        if v45 then
            v40(v45.AbsolutePosition);
            v38(v45.AbsoluteSize);
        end;
    end;
    local v47 = v35 / 2;
    local v48 = (v33 + v47) - v39;
    local v49 = v32.preferredOrientation or v11.Top;
    local v50, v51 = v4.useMemo(function()
        return getOrientationAndContentOffset(v49, v20(v48, v37), v47, v41);
    end, {
        v49, 
        v37, 
        v48, 
        v47, 
        v41
    });
    return v4.createElement(v4.Fragment, nil, {
        Portal = v9(if not if not v32.disabled then v32.active else false then v8.INACTIVE_ANIMATION_TARGETS else v8.ACTIVE_ANIMATION_TARGETS, function(v52)
            if v52.transparency == 1 then
                return nil;
            else
                local v53 = {
                    Tooltip = v4.createElement(v10, (v6.Object.assign({}, v32.tooltipProps, {
                        orientation = v50, 
                        triggerPointCenter = v48, 
                        triggerPointRadius = v47, 
                        contentOffsetVector = v51, 
                        onContentSizeChanged = v42, 
                        distanceOffset = v52.distanceOffset, 
                        transparency = v52.transparency
                    })))
                };
                return v4.createElement(l_Portal_0, {
                    target = v32.guiTarget
                }, {
                    TooltipLayer = if not v32.DEBUG_useTargetDirectly then v4.createElement("ScreenGui", {
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        IgnoreGuiInset = true, 
                        DisplayOrder = v32.DisplayOrder, 
                        [v4.Change.AbsoluteSize] = v46, 
                        [v4.Change.AbsolutePosition] = v46, 
                        ref = v46
                    }, v53) else v4.createElement("Frame", {
                        ZIndex = v32.DisplayOrder, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v4.Change.AbsoluteSize] = v46, 
                        [v4.Change.AbsolutePosition] = v46, 
                        ref = v46
                    }, v53)
                });
            end;
        end, v8.ANIMATION_OPTIONS), 
        [v32.triggerPointName or "TriggerPoint"] = v32.renderTriggerPoint(v44)
    });
end;
