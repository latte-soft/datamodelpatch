local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_0.Enum.ContentPosition);
local v4 = require(l_Parent_0.validateDetailsPageComponentList);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v6 = require(l_Parent_0.getPlatformConfig);
local v7 = require(l_Parent_0.DetailsPageTitleContent);
local v8 = require(l_Parent_2.Roact);
local v9 = require(l_Parent_2.t);
local v10 = v8.PureComponent:extend("DetailsPageBody");
v10.validateProps = v9.strictInterface({
    titleText = v9.optional(v9.string), 
    subTitleText = v9.optional(v9.string), 
    renderInfoContent = v9.optional(v9.callback), 
    componentList = v9.optional(v4), 
    dualPanelBreakpoint = v9.optional(v9.number), 
    sideMargin = v9.optional(v9.number), 
    bodyClipsDescendants = v9.optional(v9.boolean), 
    deviceType = v9.optional(v9.string)
});
v10.defaultProps = {
    bodyClipsDescendants = true
};
v10.init = function(v11)
    v11.state = {
        containerWidth = nil
    };
    v11.containerFrameRef = v8.createRef();
    v11.mounted = false;
    v11.onContainerSizeChange = function(v12)
        if v11.mounted then
            v11:setState(function(v13, _)
                if v13.containerWidth ~= v12.AbsoluteSize.x then
                    return {
                        containerWidth = v12.AbsoluteSize.x
                    };
                else
                    return nil;
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
end;
v10.renderSinglePanel = function(v15)
    local v16 = {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    for v17, v18 in pairs(v15.props.componentList) do
        v16[v17 .. "Container"] = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v18.portraitLayoutOrder
        }, {
            [v17] = v18.renderComponent()
        });
    end;
    return {
        Panel = v8.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            ClipsDescendants = false, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v16)
    };
end;
v10.renderDualPanel = function(v19)
    local v20 = v19.state.containerWidth < 1920 and 48 or 96;
    local v21 = {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    local v22 = {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 24)
        })
    };
    for v23, v24 in pairs(v19.props.componentList) do
        local l_v21_0 = v21;
        if v24.landscapePosition == v3.Right then
            l_v21_0 = v22;
        end;
        l_v21_0[v23 .. "Container"] = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v24.landscapeLayoutOrder
        }, {
            [v23] = v24.renderComponent()
        });
    end;
    return {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v20)
        }), 
        LeftPanel = v8.createElement("Frame", {
            Size = UDim2.new(0.5, -v20 / 2, 0, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, v21), 
        RightPanel = v8.createElement("Frame", {
            Size = UDim2.new(0.5, -v20 / 2, 0, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, v22)
    };
end;
v10.renderBodyContent = function(v26)
    local v27 = v26.props.dualPanelBreakpoint or 1280;
    if not v26.state.containerWidth or not v26.props.componentList then
        return {};
    elseif v26.state.containerWidth < v27 then
        return v26:renderSinglePanel();
    else
        return v26:renderDualPanel();
    end;
end;
v10.render = function(v28)
    local v29 = v28.props.deviceType == l_DeviceType_0.Phone;
    local v30 = if not v28.props.sideMargin then v6(v28.props.deviceType).sideMargin else v28.props.sideMargin;
    return v8.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v28.props.bodyClipsDescendants, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v8.Ref] = v28.containerFrameRef, 
        [v8.Change.AbsoluteSize] = v28.onContainerSizeChange
    }, {
        Layout = v8.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        UIPadding = v8.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v30), 
            PaddingRight = UDim.new(0, v30)
        }), 
        TitleInfo = v29 and v8.createElement(v7, {
            titleText = v28.props.titleText, 
            subTitleText = v28.props.subTitleText, 
            renderInfoContent = v28.props.renderInfoContent, 
            verticalAlignment = Enum.VerticalAlignment.Top, 
            layoutOrder = 1
        } or nil), 
        Padding = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v30), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        ContentFrame = v8.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 3
        }, v28:renderBodyContent()), 
        BottomPadding = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 3 * v30), 
            BackgroundTransparency = 1, 
            LayoutOrder = 4
        })
    });
end;
v10.didMount = function(v31)
    v31.mounted = true;
    if v31.containerFrameRef.current then
        v31.onContainerSizeChange(v31.containerFrameRef.current);
    end;
end;
v10.willUnmount = function(v32)
    v32.mounted = false;
end;
return v10;
