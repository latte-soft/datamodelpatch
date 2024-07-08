local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.utils.getSceneIndicesForInterpolationInputRange);
local v2 = require(l_Parent_0.utils.lerp);
local function v6(v3)
    local v4 = v3.initialPositionValue ~= v3.scene.index;
    local v5 = not v4 and 0 or 1000000;
    return {
        forceHidden = v4, 
        initialPosition = UDim2.new(0, v5, 0, v5), 
        positionStep = nil
    };
end;
return {
    forHorizontal = function(v7)
        local l_initialPositionValue_0 = v7.initialPositionValue;
        local l_layout_0 = v7.layout;
        local l_scene_0 = v7.scene;
        if l_layout_0.isMeasured then
            local v11 = v1(v7);
            if v11 then
                local l_first_0 = v11.first;
                local l_last_0 = v11.last;
                local l_index_0 = l_scene_0.index;
                local l_initWidth_0 = l_layout_0.initWidth;
                local function _(v16)
                    if v16 < l_first_0 then
                        return l_initWidth_0;
                    elseif v16 < l_index_0 then
                        return v2(l_initWidth_0, 0, (v16 - l_first_0) / (l_index_0 - l_first_0));
                    elseif v16 == l_index_0 then
                        return 0;
                    elseif v16 < l_last_0 then
                        return v2(0, -l_initWidth_0, (v16 - l_index_0) / (l_last_0 - l_index_0));
                    else
                        return -l_initWidth_0;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, if l_initialPositionValue_0 < l_first_0 then l_initWidth_0 else if l_initialPositionValue_0 < l_index_0 then v2(l_initWidth_0, 0, (l_initialPositionValue_0 - l_first_0) / (l_index_0 - l_first_0)) else l_initialPositionValue_0 == l_index_0 and 0 or if l_initialPositionValue_0 < l_last_0 then v2(0, -l_initWidth_0, (l_initialPositionValue_0 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, 0, 0), 
                    positionStep = function(v18, v19)
                        local l_current_0 = v18.current;
                        if l_current_0 then
                            local l_Position_0 = l_current_0.Position;
                            l_current_0.Position = UDim2.new(l_Position_0.X.Scale, if v19 < l_first_0 then l_initWidth_0 else if v19 < l_index_0 then v2(l_initWidth_0, 0, (v19 - l_first_0) / (l_index_0 - l_first_0)) else v19 == l_index_0 and 0 or if v19 < l_last_0 then v2(0, -l_initWidth_0, (v19 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
                            return ;
                        else
                            return ;
                        end;
                    end
                };
            else
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            end;
        else
            return (v6(v7));
        end;
    end, 
    forVertical = function(v22)
        local l_initialPositionValue_1 = v22.initialPositionValue;
        local l_layout_1 = v22.layout;
        local l_scene_1 = v22.scene;
        if l_layout_1.isMeasured then
            local v26 = v1(v22);
            if v26 then
                local l_first_1 = v26.first;
                local l_index_1 = l_scene_1.index;
                local l_initHeight_0 = l_layout_1.initHeight;
                local function v31(v30)
                    if v30 < l_first_1 then
                        return l_initHeight_0;
                    elseif v30 < l_index_1 then
                        return v2(l_initHeight_0, 0, (v30 - l_first_1) / (l_index_1 - l_first_1));
                    else
                        return 0;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, 0, 0, v31(l_initialPositionValue_1)), 
                    positionStep = function(v32, v33)
                        local l_current_1 = v32.current;
                        if l_current_1 then
                            local l_Position_1 = l_current_1.Position;
                            l_current_1.Position = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, l_Position_1.Y.Scale, v31(v33));
                            return ;
                        else
                            return ;
                        end;
                    end
                };
            else
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            end;
        else
            return (v6(v22));
        end;
    end, 
    forFade = function(v36)
        local l_initialPositionValue_2 = v36.initialPositionValue;
        local l_layout_2 = v36.layout;
        local l_scene_2 = v36.scene;
        if l_layout_2.isMeasured then
            if v1(v36) then
                local l_index_2 = l_scene_2.index;
                local function _(v41)
                    return l_index_2 - 0.5 <= v41;
                end;
                return {
                    forceHidden = not (l_index_2 - 0.5 <= l_initialPositionValue_2), 
                    initialPosition = UDim2.new(0, 0, 0, 0), 
                    positionStep = function(v43, v44)
                        local l_current_2 = v43.current;
                        if l_current_2 then
                            l_current_2.Visible = l_index_2 - 0.5 <= v44;
                            return ;
                        else
                            return ;
                        end;
                    end
                };
            else
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            end;
        else
            return (v6(v36));
        end;
    end
};
