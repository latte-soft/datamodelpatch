local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_VerticalScrollViewWithMargin_0 = v6.App.Container.VerticalScrollViewWithMargin;
local l_withStyle_0 = v6.Style.withStyle;
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local v11 = require(script.ListSection);
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.GetAssetsDifference);
local v14 = require(l_Parent_0.Actions.AddAnalyticsInfo);
local v15 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v16 = v2.PureComponent:extend("ItemsList");
v16.validateProps = v5.strictInterface({
    humanoidDescription = v5.optional(v5.instanceOf("HumanoidDescription")), 
    loadingFailed = v5.boolean, 
    retryLoadDescription = v5.callback, 
    itemListScrollableUpdated = v5.optional(v5.callback), 
    addAnalyticsInfo = v5.callback
});
v16.init = function(v17)
    v17:setState({
        canvasSizeY = 0, 
        loading = true, 
        addedAssetNames = nil, 
        removedAssetNames = nil
    });
    v17.mounted = false;
    v17.frameRef = v2.createRef();
    local v18, v19 = v2.createBinding(false);
    v17.topGradientVisibleBinding = v18;
    v17.updateTopGradientVisibleBinding = v19;
    v18, v19 = v2.createBinding(false);
    v17.bottomGradientVisibleBinding = v18;
    v17.updateBottomGradientVisibleBinding = v19;
    v17.addedSectionRef = v2.createRef();
    v17.removedSectionRef = v2.createRef();
    v17.noChangedAssetsRef = v2.createRef();
    v17.lastWasScrollable = nil;
    v17.checkIsScrollable = function()
        local v20 = v17.frameRef:getValue();
        if v20 then
            if v17.props.itemListScrollableUpdated then
                local v21 = v20.AbsoluteSize.Y < v17.state.canvasSizeY;
                if v21 ~= v17.lastWasScrollable then
                    v17.lastWasScrollable = v21;
                    v17.props.itemListScrollableUpdated(v21, v20.AbsoluteSize.Y);
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v17.onContentSizeChanged = function(v22)
        v17:setState({
            canvasSizeY = v22.AbsoluteContentSize.Y
        });
    end;
    v17.firstEntryPositionChanged = function(v23)
        local v24 = v17.frameRef:getValue();
        if v24 then
            if v23.AbsolutePosition.Y < v24.AbsolutePosition.Y then
                v17.updateTopGradientVisibleBinding(true);
                return ;
            else
                v17.updateTopGradientVisibleBinding(false);
                return ;
            end;
        else
            return ;
        end;
    end;
    v17.lastEntryPositionChanged = function(v25)
        local v26 = v17.frameRef:getValue();
        if v26 then
            if v26.AbsolutePosition.Y + v26.AbsoluteSize.Y < v25.AbsolutePosition.Y + v25.AbsoluteSize.Y then
                v17.updateBottomGradientVisibleBinding(true);
                return ;
            else
                v17.updateBottomGradientVisibleBinding(false);
                return ;
            end;
        else
            return ;
        end;
    end;
    v17.loadAssetNames = function()
        coroutine.wrap(function()
            v13(v17.props.humanoidDescription):andThen(function(v27)
                if v17.mounted then
                    v17.props.addAnalyticsInfo(v27.addedAssetIds, v27.removedAssetIds);
                    v17:setState({
                        loading = false, 
                        addedAssetNames = v27.addedNames, 
                        removedAssetNames = v27.removedNames
                    });
                end;
            end, function(_)
                if v17.mounted then
                    v17:setState({
                        loading = false
                    });
                end;
            end);
        end)();
    end;
    v17.onRetryLoading = function()
        v17:setState({
            loading = true
        });
        if not v17.props.humanoidDescription then
            v17.props.retryLoadDescription();
            return ;
        else
            v17.loadAssetNames();
            return ;
        end;
    end;
end;
v16.createEntriesList = function(v29)
    local v30 = {};
    if #v29.state.addedAssetNames > 0 then
        table.insert(v30, v2.createElement(v3.Focusable[v11], {
            headerText = v15:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding"), 
            items = v29.state.addedAssetNames, 
            layoutOrder = 1, 
            isFirstSection = true, 
            isLastSection = #v29.state.removedAssetNames == 0, 
            NextSelectionDown = v29.removedSectionRef, 
            [v2.Ref] = v29.addedSectionRef
        }));
        if #v29.state.removedAssetNames > 0 then
            table.insert(v30, v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                LayoutOrder = 2
            }));
        end;
    end;
    if #v29.state.removedAssetNames > 0 then
        table.insert(v30, v2.createElement(v3.Focusable[v11], {
            headerText = v15:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing"), 
            items = v29.state.removedAssetNames, 
            layoutOrder = 3, 
            isFirstSection = #v29.state.addedAssetNames == 0, 
            isLastSection = true, 
            NextSelectionUp = v29.addedSectionRef, 
            [v2.Ref] = v29.removedSectionRef
        }));
    end;
    local v31 = false;
    if #v29.state.addedAssetNames == 0 then
        v31 = #v29.state.removedAssetNames == 0;
    end;
    if v31 then
        table.insert(v30, v2.createElement(v3.Focusable[v11], {
            headerText = v15:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets"), 
            items = {}, 
            layoutOrder = 1, 
            isFirstSection = true, 
            isLastSection = true, 
            [v2.Ref] = v29.noChangedAssetsRef
        }));
    end;
    return v30;
end;
v16.renderItemsList = function(v32)
    return l_withStyle_0(function(v33)
        local l_Theme_0 = v33.Theme;
        local v35 = v32:createEntriesList();
        v35.Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Change.AbsoluteContentSize] = v32.onContentSizeChanged
        });
        return v2.createElement(v3.Focusable.Frame, {
            defaultChild = v32.addedSectionRef, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v2.Ref] = v32.frameRef
        }, {
            TopGradient = v2.createElement("Frame", {
                Visible = v32.topGradientVisibleBinding, 
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            ScrollView = v2.createElement(l_VerticalScrollViewWithMargin_0, {
                size = UDim2.fromScale(1, 1), 
                canvasSizeY = UDim.new(0, v32.state.canvasSizeY)
            }, v35), 
            BottomGradient = v2.createElement("Frame", {
                Visible = v32.bottomGradientVisibleBinding, 
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        });
    end);
end;
v16.renderLoading = function(_)
    return v2.createElement(l_ShimmerPanel_0, {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
end;
v16.renderFailed = function(v37)
    return v2.createElement(l_EmptyState_0, {
        text = v15:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"), 
        size = UDim2.fromScale(1, 1), 
        onActivated = v37.onRetryLoading
    });
end;
v16.render = function(v38)
    if not (v38.state.loading and not v38.props.loadingFailed) then
        if not v38.state.addedAssetNames then
            return v38:renderFailed();
        else
            return v38:renderItemsList();
        end;
    else
        return v38:renderLoading();
    end;
end;
v16.didMount = function(v39)
    v39.mounted = true;
    if v39.props.humanoidDescription then
        v39.loadAssetNames();
    end;
    v39.checkIsScrollable();
end;
v16.didUpdate = function(v40, v41, _)
    v40.checkIsScrollable();
    if v41.humanoidDescription ~= v40.props.humanoidDescription then
        v40:setState({
            loading = true, 
            addedAssetNames = v2.None, 
            removedAssetNames = v2.None
        });
        v40.loadAssetNames();
    end;
end;
v16.willUnmount = function(v43)
    v43.mounted = false;
end;
return v4.connect(nil, function(v44)
    return {
        addAnalyticsInfo = function(v45)
            return v44(v14(v45));
        end
    };
end)(v16);
