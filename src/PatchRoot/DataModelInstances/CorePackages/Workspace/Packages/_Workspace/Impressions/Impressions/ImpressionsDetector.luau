local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.t);
local l_withNavigationFocus_0 = require(l_Parent_0.RoactNavigation).withNavigationFocus;
local v6 = require(script.Parent.Constants);
local v7 = v2.PureComponent:extend("ImpressionsDetector");
v7.validateProps = v4.strictInterface({
    scanDebounceSeconds = v4.optional(v4.number), 
    viewFillPercent = v4.optional(v4.number), 
    parentRef = v4.optional(v4.table), 
    impressionsTag = v4.string, 
    onRequestImpressionsSignal = v4.table, 
    viewPortBounds = v4.strictInterface({
        min = v4.Vector2, 
        max = v4.Vector2
    }), 
    filterImpressionFunc = v4.optional(v4.callback), 
    onImpressionsDetected = v4.union(v4.callback, v4.table), 
    skipZeroSizes = v4.optional(v4.boolean), 
    isFocused = v4.boolean, 
    navigation = v4.table
});
v7.defaultProps = {
    scanDebounceSeconds = 1, 
    viewFillPercent = 0.25
};
v7.init = function(v8)
    v8.isMounted = false;
    v8.lastImpressionTick = nil;
    v8.nextImpressionTick = nil;
end;
v7._boundingBoxIntersectsView = function(v9, v10)
    if v10 then
        local l_viewPortBounds_0 = v9.props.viewPortBounds;
        v3.assert(l_viewPortBounds_0 ~= nil);
        if l_viewPortBounds_0 then
            local l_AbsoluteSize_0 = v10.AbsoluteSize;
            local l_AbsolutePosition_0 = v10.AbsolutePosition;
            local v14 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
            local v15 = false;
            if l_viewPortBounds_0.min.X < v14.X then
                v15 = l_AbsolutePosition_0.X < l_viewPortBounds_0.max.X;
            end;
            local v16 = false;
            if l_viewPortBounds_0.min.Y < v14.Y then
                v16 = l_AbsolutePosition_0.Y < l_viewPortBounds_0.max.Y;
            end;
            if not v15 or not v16 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v7._isInstanceVisible = function(v17, v18)
    if v17:_boundingBoxIntersectsView(v18) then
        local l_viewPortBounds_1 = v17.props.viewPortBounds;
        v3.assert(l_viewPortBounds_1 ~= nil);
        local v20 = nil;
        local v21 = l_viewPortBounds_1.max - l_viewPortBounds_1.min;
        if not (v21.X > 0) or v21.Y <= 0 then
            return false;
        else
            v20 = v21 * v17.props.viewFillPercent;
            v21 = v3.assert;
            local v22 = false;
            if v20.X > 0 then
                v22 = v20.Y > 0;
            end;
            v21(v22);
            if not (v20.X > 0) or v20.Y <= 0 then
                return false;
            else
                v21 = v18.AbsolutePosition;
                v22 = v18.AbsoluteSize;
                if v17.props.skipZeroSizes and (not (v22.X ~= 0) or v22.Y == 0) then
                    return false;
                else
                    local v23 = v21 + v22 / 2;
                    local v24 = v21 + v22;
                    local v25 = false;
                    if l_viewPortBounds_1.min.X < v23.X then
                        v25 = v23.X < l_viewPortBounds_1.max.X;
                    end;
                    local v26 = false;
                    if l_viewPortBounds_1.min.Y < v23.Y then
                        v26 = v23.Y < l_viewPortBounds_1.max.Y;
                    end;
                    if not v25 or not v26 then
                        local v27 = v24:Min(l_viewPortBounds_1.max) - v21:Max(l_viewPortBounds_1.min);
                        local v28 = v20.X <= v27.X;
                        if not v26 or not v28 then
                            local v29 = v20.Y <= v27.Y;
                            if not v25 or not v29 then
                                if not v28 or not v29 then
                                    return false;
                                else
                                    return true;
                                end;
                            else
                                return true;
                            end;
                        else
                            return true;
                        end;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    else
        return false;
    end;
end;
v7._calculateImpressions = function(v30)
    if v30.isMounted then
        if v30.props.isFocused then
            v30.lastImpressionTick = tick();
            if v30.props.parentRef ~= nil then
                local l_current_0 = v30.props.parentRef.current;
                if not (l_current_0 ~= nil and v30:_boundingBoxIntersectsView(l_current_0)) then
                    return ;
                end;
            end;
            local l_impressionsTag_0 = v30.props.impressionsTag;
            local v33 = {};
            for _, v35 in ipairs((l_CollectionService_0:GetTagged(l_impressionsTag_0))) do
                local l_v35_Attribute_0 = v35:GetAttribute(v6.ItemIndex);
                if not (((not l_v35_Attribute_0 or not v35:isA("GuiObject")) or not v30:_isInstanceVisible(v35)) or v30.props.filterImpressionFunc ~= nil and not v30.props.filterImpressionFunc(l_v35_Attribute_0)) then
                    table.insert(v33, l_v35_Attribute_0);
                end;
            end;
            if #v33 > 0 then
                v3.assert(v30.props.onImpressionsDetected ~= nil);
                v30.props.onImpressionsDetected(v33);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v7._requestImpressions = function(v37)
    if v37.isMounted then
        if v37.props.isFocused then
            if v37.nextImpressionTick ~= nil then
                return ;
            elseif v37.props.impressionsTag then
                local v38 = 0;
                if v37.lastImpressionTick ~= nil then
                    v37.nextImpressionTick = v37.lastImpressionTick + v37.props.scanDebounceSeconds;
                    v38 = v37.nextImpressionTick - tick();
                end;
                if v38 > 0 then
                    task.delay(v38, function()
                        local l_assert_0 = v3.assert;
                        local v40 = false;
                        if v37.nextImpressionTick ~= nil then
                            v40 = v37.nextImpressionTick < tick();
                        end;
                        l_assert_0(v40);
                        v37.nextImpressionTick = nil;
                        v37:_calculateImpressions();
                    end);
                    return ;
                else
                    v37.nextImpressionTick = nil;
                    v37:_calculateImpressions();
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v7.render = function(_)
    return nil;
end;
v7.didMount = function(v42)
    v42.isMounted = true;
    v42:_requestImpressions();
    if v42.props.onRequestImpressionsSignal then
        v42.onRequestImpressionsConnection = v42.props.onRequestImpressionsSignal:connect(function()
            v42:_requestImpressions();
        end);
    end;
end;
v7.willUnmount = function(v43)
    v43.isMounted = false;
    if v43.onRequestImpressionsConnection ~= nil then
        v43.onRequestImpressionsConnection:disconnect();
        v43.onRequestImpressionsConnection = nil;
    end;
end;
v7.didUpdate = function(v44, _, _)
    v44:_requestImpressions();
end;
return (l_withNavigationFocus_0(v7));
