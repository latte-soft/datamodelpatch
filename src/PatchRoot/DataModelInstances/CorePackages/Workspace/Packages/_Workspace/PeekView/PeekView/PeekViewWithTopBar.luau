local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useRouteName_0 = require(l_Parent_0.RoactUtils).Hooks.useRouteName;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(script.Parent.PeekView);
local v8 = require(script.Parent.PeekViewState);
local l_GetFFlagPeekViewScrimLogging_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimLogging;
local v10 = require(script.Parent.analytics.peekViewDismissedEvent);
local l_GetFFlagEDPContextRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEDPContextRedesign;
return function(v12)
    local v13 = nil;
    local v14 = nil;
    if l_GetFFlagPeekViewScrimLogging_0() then
        v14 = l_useRouteName_0();
        v13 = l_useRoactService_0(l_AppEventIngestService_0);
    end;
    local v15 = l_useStyle_0();
    local l_onClosed_0 = v12.onClosed;
    local l_onViewStateChanged_0 = v12.onViewStateChanged;
    local v21 = v2.useCallback(function(v18, v19, v20)
        if not l_GetFFlagPeekViewScrimLogging_0() then
            if not (not (v18 == v8.Closed) or not l_onClosed_0) then
                l_onClosed_0();
            end;
        elseif v18 == v8.Closed then
            if l_onClosed_0 then
                l_onClosed_0();
            end;
            if not (not v20.dismissMethod or not v13) then
                v10.logEvent(v13, "PeekView", v1.Dictionary.join(v12.viewChangedEventMeta or {}, v20, {
                    page = v14
                }));
            end;
        end;
        if l_onViewStateChanged_0 then
            l_onViewStateChanged_0(v18, v19);
        end;
    end, if not l_GetFFlagPeekViewScrimLogging_0() then {
        l_onClosed_0, 
        l_onViewStateChanged_0
    } else {
        l_onClosed_0, 
        l_onViewStateChanged_0, 
        v12.viewChangedEventMeta, 
        v13, 
        v14
    });
    local v22, v23 = v2.useBinding(0);
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    if l_GetFFlagEDPContextRedesign_0() then
        local v29, v30 = v2.useBinding(0);
        v24 = v29;
        v25 = v30;
        v29, v30 = v2.useBinding(0);
        v26 = v29;
        v27 = v30;
        v28 = v2.joinBindings({
            position = v24, 
            offset = v12.solidifyTopBarOffset, 
            frameSize = v26
        });
    end;
    return v2.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(v12.viewWidth or UDim.new(1, 0), UDim.new(1, 0)), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PeekViewTopBar = v2.createElement("CanvasGroup", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v12.topBarHeight), 
            BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
            Active = if not l_GetFFlagEDPContextRedesign_0() then nil else if v12.solidifyTopBarOffset then v28:map(function(v31)
                return v31.offset + v31.frameSize < v31.position;
            end) else false, 
            BackgroundTransparency = if not l_GetFFlagEDPContextRedesign_0() then nil else if v12.solidifyTopBarOffset then v28:map(function(v32)
                if v32.offset + v32.frameSize < v32.position then
                    return 0;
                else
                    return 1;
                end;
            end) else 1, 
            BorderSizePixel = if not l_GetFFlagEDPContextRedesign_0() then nil else 0, 
            GroupTransparency = v22:map(function(v33)
                return 1 - v33;
            end), 
            ZIndex = 2
        }, {
            PeekViewTopBarInner = v12.topBarSlot
        }), 
        PeekViewContainer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            PeekView = v2.createElement(v7, {
                hasScrim = true, 
                fullViewContentHeight = v12.fullViewContentHeight, 
                briefViewContentHeight = v12.briefViewContentHeight, 
                bottomDockedContainerHeight = v12.bottomDockedContainerHeight, 
                bottomDockedContainerContent = {
                    PeekViewBottomBar = v12.bottomBarSlot
                }, 
                mountAsFullView = v12.mountAsFullView, 
                mountAnimation = v12.mountAnimation, 
                viewStateChanged = v21, 
                briefToFullTransitionPercent = if not l_GetFFlagEDPContextRedesign_0() then v23 else if not l_GetFFlagEDPContextRedesign_0() then nil else function(v34)
                    v23(v34);
                    if v12.transitionPercentCallback then
                        v12.transitionPercentCallback(v34);
                    end;
                end, 
                peekHeaderPositionYChange = if not l_GetFFlagEDPContextRedesign_0() then nil else v25, 
                onScrollingFrameSizeChanged = if not l_GetFFlagEDPContextRedesign_0() then nil else if not l_GetFFlagEDPContextRedesign_0() then nil else function(v35)
                    v27(v35.AbsoluteSize.Y);
                end, 
                overlayDragger = if not l_GetFFlagEDPContextRedesign_0() then nil else v12.overlayDragger
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = v12.contentSlot
            })
        })
    });
end;
