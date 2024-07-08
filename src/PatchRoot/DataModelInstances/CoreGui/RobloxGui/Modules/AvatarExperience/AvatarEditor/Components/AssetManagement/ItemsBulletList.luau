local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_Focusable_0 = v4.Focusable;
local l_VerticalScrollViewWithMargin_0 = v6.App.Container.VerticalScrollViewWithMargin;
local l_withStyle_0 = v6.Style.withStyle;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.BulletListEntry);
local v11 = v3.PureComponent:extend("ItemsBulletList");
v11.validateProps = v5.strictInterface({
    items = v5.array(v5.string), 
    maxHeight = v5.number, 
    onScrollableUpdated = v5.callback, 
    forwardRef = v5.table
});
v11.init = function(v12)
    v12:setState({
        canvasSizeY = 0
    });
    v12.scrollViewRef = v3.createRef();
    local v13, v14 = v3.createBinding(false);
    v12.topGradientVisibleBinding = v13;
    v12.updateTopGradientVisibleBinding = v14;
    v13, v14 = v3.createBinding(false);
    v12.bottomGradientVisibleBinding = v13;
    v12.updateBottomGradientVisibleBinding = v14;
    v12.checkIsScrollable = function()
        v12.props.onScrollableUpdated(v12.props.maxHeight < v12.state.canvasSizeY);
    end;
    v12.onContentSizeChanged = function(v15)
        if v12.state.canvasSizeY ~= v15.AbsoluteContentSize.Y then
            v12:setState({
                canvasSizeY = v15.AbsoluteContentSize.Y
            });
        end;
    end;
    v13 = v12.props.forwardRef;
    v12.firstEntryPositionChanged = function(v16)
        local v17 = v13:getValue();
        if v17 then
            if v16.AbsolutePosition.Y + 5 < v17.AbsolutePosition.Y then
                v12.updateTopGradientVisibleBinding(true);
                return ;
            else
                v12.updateTopGradientVisibleBinding(false);
                return ;
            end;
        else
            return ;
        end;
    end;
    v12.lastEntryPositionChanged = function(v18)
        local v19 = v13:getValue();
        if v19 then
            if v19.AbsolutePosition.Y + v19.AbsoluteSize.Y < (v18.AbsolutePosition.Y + v18.AbsoluteSize.Y) - 5 then
                v12.updateBottomGradientVisibleBinding(true);
                return ;
            else
                v12.updateBottomGradientVisibleBinding(false);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v11.createBulletList = function(v20)
    local v21 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v3.Change.AbsoluteContentSize] = v20.onContentSizeChanged
        })
    };
    for v22, v23 in v20.props.items, nil, nil do
        local v24 = nil;
        if v22 == 1 then
            v24 = v20.firstEntryPositionChanged;
        elseif v22 == #v20.props.items then
            v24 = v20.lastEntryPositionChanged;
        end;
        v21[v22] = v3.createElement(v10, {
            text = v23, 
            layoutOrder = v22, 
            positionChangedCallback = v24
        });
    end;
    return v21;
end;
v11.renderWithProviders = function(v25, v26)
    local l_Theme_0 = v26.Theme;
    return v3.createElement(l_Focusable_0.Frame, {
        defaultChild = v25.scrollViewRef, 
        restorePreviousChildFocus = true, 
        Size = UDim2.new(1, 0, 0, (math.min(v25.state.canvasSizeY, v25.props.maxHeight))), 
        BackgroundTransparency = 1, 
        [v3.Ref] = v25.props.forwardRef
    }, {
        TopGradient = v3.createElement("Frame", {
            Visible = v25.topGradientVisibleBinding, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ScrollView = v3.createElement(l_VerticalScrollViewWithMargin_0, {
            size = UDim2.fromScale(1, 1), 
            canvasSizeY = UDim.new(0, v25.state.canvasSizeY), 
            isGamepadFocusable = true, 
            [v3.Ref] = v25.scrollViewRef
        }, (v25:createBulletList())), 
        BottomGradient = v3.createElement("Frame", {
            Visible = v25.bottomGradientVisibleBinding, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;
v11.render = function(v28)
    return l_withStyle_0(function(v29)
        return v28:renderWithProviders(v29);
    end);
end;
v11.didMount = function(v30)
    v30.checkIsScrollable();
end;
v11.didUpdate = function(v31, v32, v33)
    local v34 = v31.props.maxHeight ~= v32.maxHeight;
    local v35 = v31.state.canvasSizeY ~= v33.canvasSizeY;
    if not (not v34 and not v35) then
        v31.checkIsScrollable();
    end;
end;
return v3.forwardRef(function(v36, v37)
    return v3.createElement(v11, v2.Dictionary.join(v36, {
        forwardRef = v37
    }));
end);
