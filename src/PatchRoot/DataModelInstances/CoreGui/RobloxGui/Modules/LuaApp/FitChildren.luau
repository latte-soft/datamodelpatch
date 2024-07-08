local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Immutable);
local v4 = require(l_Modules_0.Common.Symbol);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v7 = {
    FitAxis = {
        Width = v4.named("Width"), 
        Height = v4.named("Height"), 
        Both = v4.named("Both")
    }
};
v7.wrap = function(v8)
    local v9 = v2.PureComponent:extend(("FitChildren(%s)"):format((tostring(v8))));
    v9.disconnectSignals = function(v10)
        for _, v12 in ipairs(v10.signals) do
            v12:Disconnect();
        end;
    end;
    v9.resize = function(v13)
        local v14 = v13.props.fitFields or if v13.props.fitAxis then {
            Size = v13.props.fitAxis
        } else {
            Size = v7.FitAxis.Both
        };
        v13:disconnectSignals();
        v13.signals = {};
        local l_current_0 = v13.ref.current;
        if l_current_0 == nil then
            return ;
        else
            local l_UIGridStyleLayout_0 = l_current_0:FindFirstChildWhichIsA("UIGridStyleLayout");
            if not l_UIGridStyleLayout_0 then
                v13:resizeFromChildren(v14);
                for _, v18 in ipairs((l_current_0:GetChildren())) do
                    if v18:IsA("GuiBase2d") then
                        table.insert(v13.signals, (v18:GetPropertyChangedSignal("Size"):Connect(function()
                            v13:resizeFromChildren(v14);
                        end)));
                        table.insert(v13.signals, (v18:GetPropertyChangedSignal("Position"):Connect(function()
                            v13:resizeFromChildren(v14);
                        end)));
                    end;
                end;
            else
                table.insert(v13.signals, (l_UIGridStyleLayout_0:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    local l_AbsoluteContentSize_0 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                    v13:applyFit(v14, l_AbsoluteContentSize_0.x, l_AbsoluteContentSize_0.y);
                end)));
                local l_AbsoluteContentSize_1 = l_UIGridStyleLayout_0.AbsoluteContentSize;
                v13:applyFit(v14, l_AbsoluteContentSize_1.x, l_AbsoluteContentSize_1.y);
            end;
            return ;
        end;
    end;
    v9.resizeFromChildren = function(v21, v22)
        local l_current_1 = v21.ref.current;
        if l_current_1 == nil then
            return ;
        else
            local l_AbsolutePosition_0 = l_current_1.AbsolutePosition;
            local l_l_current_1_Children_0 = l_current_1:GetChildren();
            local v26 = 0;
            local v27 = 0;
            for _, v29 in ipairs(l_l_current_1_Children_0) do
                if v29:IsA("GuiBase2d") then
                    local l_AbsoluteSize_0 = v29.AbsoluteSize;
                    local l_AbsolutePosition_1 = v29.AbsolutePosition;
                    v26 = math.max(v26, (l_AbsolutePosition_1.x - l_AbsolutePosition_0.x) + l_AbsoluteSize_0.x);
                    v27 = math.max(v27, (l_AbsolutePosition_1.y - l_AbsolutePosition_0.y) + l_AbsoluteSize_0.y);
                end;
            end;
            v21:applyFit(v22, v26, v27);
            return ;
        end;
    end;
    v9.applyFit = function(v32, v33, v34, v35)
        local l_current_2 = v32.ref.current;
        if l_current_2 == nil then
            return ;
        else
            local l_UIPadding_0 = l_current_2:FindFirstChildOfClass("UIPadding");
            local v38 = v32.props.Size or UDim2.new(0, 0, 0, 0);
            local l_Width_0 = v7.FitAxis.Width;
            local l_Height_0 = v7.FitAxis.Height;
            local function v52(v41, v42, v43, v44, v45, v46)
                local v47 = true;
                if v41 ~= v42 then
                    v47 = v41 == v7.FitAxis.Both;
                end;
                local v48 = nil;
                local v49 = nil;
                if not v47 then
                    return v44.Scale, v44.Offset;
                else
                    v48 = 0;
                    if not l_UIPadding_0 then
                        return v48, v43;
                    else
                        local v50 = l_UIPadding_0[v45].Scale + l_UIPadding_0[v46].Scale;
                        local v51 = l_UIPadding_0[v45].Offset + l_UIPadding_0[v46].Offset;
                        if v50 == 1 then
                            error("Can not apply FitChildren to a component with 100% padding width");
                            return v48, v49;
                        else
                            return v48, (v43 + v51) / (1 - v50);
                        end;
                    end;
                end;
            end;
            for v53, v54 in pairs(v33) do
                local v55, v56 = v52(v54, l_Width_0, v34, v38.X, "PaddingLeft", "PaddingRight");
                local v57, v58 = v52(v54, l_Height_0, v35, v38.Y, "PaddingTop", "PaddingBottom");
                l_current_2[v53] = UDim2.new(v55, v56, v57, v58);
            end;
            return ;
        end;
    end;
    v9.init = function(v59)
        v59.signals = {};
        local l_forwardRef_0 = v59.props.forwardRef;
        assert(type(l_forwardRef_0) ~= "function", ("%s does not support function ref forwarding"):format((tostring(v9))));
        v59.ref = l_forwardRef_0 or v2.createRef();
    end;
    v9.render = function(v61)
        local v62 = v3.RemoveFromDictionary(v61.props, "fitAxis", "fitFields", "forwardRef");
        v62[v2.Ref] = v61.ref;
        return v2.createElement(v8, v62);
    end;
    v9.didMount = function(v63)
        v63:resize();
    end;
    v9.didUpdate = function(v64)
        v64:resize();
    end;
    v9.willUnmount = function(v65)
        v65:disconnectSignals();
    end;
    return v2.forwardRef(function(v66, v67)
        return v2.createElement(v9, v1.Dictionary.join(v66, {
            forwardRef = v67
        }));
    end);
end;
v7.FitFrame = v7.wrap("Frame");
v7.FitScrollingFrame = v7.wrap("ScrollingFrame");
v7.FitTextButton = v7.wrap("TextButton");
v7.FitImageLabel = v7.wrap(v5);
v7.FitImageButton = v7.wrap(v6);
return v7;
