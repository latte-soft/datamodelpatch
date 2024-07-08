local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.LayerCollectorContext);
local l_GuiService_0 = game:GetService("GuiService");
local v3 = v0.PureComponent:extend("LayerCollectorProvider");
v3.init = function(v4)
    v4.rootRef = v0.createRef();
    v4.state = {
        absoluteSize = Vector2.new(0, 0)
    };
end;
v3.watchLayerCollector = function(v5, v6)
    local l_AbsoluteSize_0 = v6.AbsoluteSize;
    local l_status_0, l_result_0 = pcall(function()
        return v6.IgnoreGuiInset;
    end);
    if not (not l_status_0 or not l_result_0) then
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_0;
    end;
    v5:setState({
        absoluteSize = l_AbsoluteSize_0
    });
    v5.absoluteSizeConnection = v6:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        l_AbsoluteSize_0 = v6.AbsoluteSize;
        local l_status_1, l_result_1 = pcall(function()
            return v6.IgnoreGuiInset;
        end);
        if not (not l_status_1 or not l_result_1) then
            local l_l_GuiService_0_GuiInset_1, _ = l_GuiService_0:GetGuiInset();
            l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_1;
        end;
        v5:setState({
            absoluteSize = l_AbsoluteSize_0
        });
    end);
end;
v3.didMount = function(v16)
    local l_current_0 = v16.rootRef.current;
    local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
    if l_l_current_0_FirstAncestorWhichIsA_0 == nil then
        v16.ancestryConnection = l_current_0.AncestryChanged:Connect(function()
            l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
            if l_l_current_0_FirstAncestorWhichIsA_0 ~= nil then
                v16.ancestryConnection:Disconnect();
                v16.ancestryConnection = nil;
                v16:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
            end;
        end);
    else
        v16:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
    end;
end;
v3.render = function(v19)
    return v0.createElement(v1.Provider, {
        value = {
            absoluteSize = v19.state.absoluteSize
        }
    }, {
        LayerCollectorChildRef = v0.createElement("Frame", {
            Visible = false, 
            [v0.Ref] = v19.rootRef
        }), 
        Children = v0.createFragment(v19.props[v0.Children])
    });
end;
return v3;
