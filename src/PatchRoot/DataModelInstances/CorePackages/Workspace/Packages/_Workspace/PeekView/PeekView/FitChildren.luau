local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v5 = {
    FitAxis = {
        Width = l_Symbol_0.named("Width"), 
        Height = l_Symbol_0.named("Height"), 
        Both = l_Symbol_0.named("Both")
    }
};
v5.wrap = function(v6)
    local v7 = v2.PureComponent:extend(("FitChildren(%s)"):format((tostring(v6))));
    v7.disconnectSignals = function(v8)
        for _, v10 in ipairs(v8.signals) do
            v10:Disconnect();
        end;
    end;
    v7.resize = function(v11)
        local v12 = v11.props.fitFields or if v11.props.fitAxis then {
            Size = v11.props.fitAxis
        } else {
            Size = v5.FitAxis.Both
        };
        v11:disconnectSignals();
        v11.signals = {};
        local l_current_0 = v11.ref.current;
        if l_current_0 == nil then
            return ;
        else
            local l_UIGridStyleLayout_0 = l_current_0:FindFirstChildWhichIsA("UIGridStyleLayout");
            if not l_UIGridStyleLayout_0 then
                v11:resizeFromChildren(v12);
                for _, v16 in ipairs((l_current_0:GetChildren())) do
                    if v16:IsA("GuiBase2d") then
                        table.insert(v11.signals, (v16:GetPropertyChangedSignal("Size"):Connect(function()
                            v11:resizeFromChildren(v12);
                        end)));
                        table.insert(v11.signals, (v16:GetPropertyChangedSignal("Position"):Connect(function()
                            v11:resizeFromChildren(v12);
                        end)));
                    end;
                end;
            else
                table.insert(v11.signals, (l_UIGridStyleLayout_0:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    local l_AbsoluteContentSize_0 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                    v11:applyFit(v12, l_AbsoluteContentSize_0.x, l_AbsoluteContentSize_0.y);
                end)));
                local l_AbsoluteContentSize_1 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                v11:applyFit(v12, l_AbsoluteContentSize_1.x, l_AbsoluteContentSize_1.y);
            end;
            return ;
        end;
    end;
    v7.resizeFromChildren = function(v19, v20)
        local l_current_1 = v19.ref.current;
        if l_current_1 == nil then
            return ;
        else
            local l_AbsolutePosition_0 = l_current_1.AbsolutePosition;
            local l_l_current_1_Children_0 = l_current_1:GetChildren();
            local v24 = 0;
            local v25 = 0;
            for _, v27 in ipairs(l_l_current_1_Children_0) do
                if v27:IsA("GuiBase2d") then
                    local l_AbsoluteSize_0 = v27.AbsoluteSize;
                    local l_AbsolutePosition_1 = v27.AbsolutePosition;
                    v24 = math.max(v24, (l_AbsolutePosition_1.x - l_AbsolutePosition_0.x) + l_AbsoluteSize_0.x);
                    v25 = math.max(v25, (l_AbsolutePosition_1.y - l_AbsolutePosition_0.y) + l_AbsoluteSize_0.y);
                end;
            end;
            v19:applyFit(v20, v24, v25);
            return ;
        end;
    end;
    v7.applyFit = function(v30, v31, v32, v33)
        local l_current_2 = v30.ref.current;
        if l_current_2 == nil then
            return ;
        else
            local l_UIPadding_0 = l_current_2:FindFirstChildOfClass("UIPadding");
            local v36 = v30.props.Size or UDim2.new(0, 0, 0, 0);
            local l_Width_0 = v5.FitAxis.Width;
            local l_Height_0 = v5.FitAxis.Height;
            local function v50(v39, v40, v41, v42, v43, v44)
                local v45 = true;
                if v39 ~= v40 then
                    v45 = v39 == v5.FitAxis.Both;
                end;
                local v46 = nil;
                local v47 = nil;
                if not v45 then
                    return v42.Scale, v42.Offset;
                else
                    v46 = 0;
                    if not l_UIPadding_0 then
                        return v46, v41;
                    else
                        local v48 = l_UIPadding_0[v43].Scale + l_UIPadding_0[v44].Scale;
                        local v49 = l_UIPadding_0[v43].Offset + l_UIPadding_0[v44].Offset;
                        if v48 == 1 then
                            error("Can not apply FitChildren to a component with 100% padding width");
                            return v46, v47;
                        else
                            return v46, (v41 + v49) / (1 - v48);
                        end;
                    end;
                end;
            end;
            for v51, v52 in pairs(v31) do
                local v53, v54 = v50(v52, l_Width_0, v32, v36.X, "PaddingLeft", "PaddingRight");
                local v55, v56 = v50(v52, l_Height_0, v33, v36.Y, "PaddingTop", "PaddingBottom");
                l_current_2[v51] = UDim2.new(v53, v54, v55, v56);
            end;
            return ;
        end;
    end;
    v7.init = function(v57)
        v57.signals = {};
        local l_forwardRef_0 = v57.props.forwardRef;
        assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v7))));
        v57.ref = l_forwardRef_0 or v2.createRef();
    end;
    v7.render = function(v59)
        local v60 = l_Immutable_0.RemoveFromDictionary(v59.props, "fitAxis", "fitFields", "forwardRef");
        v60[v2.Ref] = v59.ref;
        return v2.createElement(v6, v60);
    end;
    v7.didMount = function(v61)
        v61:resize();
    end;
    v7.didUpdate = function(v62)
        v62:resize();
    end;
    v7.willUnmount = function(v63)
        v63:disconnectSignals();
    end;
    return v2.forwardRef(function(v64, v65)
        return v2.createElement(v7, v1.Dictionary.join(v64, {
            forwardRef = v65
        }));
    end);
end;
v5.FitFrame = v5.wrap("Frame");
v5.FitScrollingFrame = v5.wrap("ScrollingFrame");
v5.FitTextButton = v5.wrap("TextButton");
return v5;
