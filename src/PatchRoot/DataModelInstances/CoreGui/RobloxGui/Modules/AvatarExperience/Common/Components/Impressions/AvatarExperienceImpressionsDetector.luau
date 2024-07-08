local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.getCurrentPage);
local v7 = v2.PureComponent:extend("AvatarExperienceImpressionsDetector");
v7.validateProps = v5.strictInterface({
    scanDebounceSeconds = v5.optional(v5.number), 
    viewFillPercent = v5.optional(v5.number), 
    parentRef = v5.optional(v5.table), 
    onRequestImpressionsSignal = v5.table, 
    viewPortBounds = v5.strictInterface({
        min = v5.Vector2, 
        max = v5.Vector2
    }), 
    appPage = v5.optional(v5.string), 
    currentPage = v5.optional(v5.string), 
    pageFilter = v5.optional(v5.callback), 
    collectObjectsFunc = v5.optional(v5.callback), 
    filterImpressionFunc = v5.optional(v5.callback), 
    onImpressionsDetected = v5.union(v5.callback, v5.table)
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
v7._isInstanceVisible = function(v9, v10)
    if v10 then
        local l_viewPortBounds_0 = v9.props.viewPortBounds;
        v4.assert(l_viewPortBounds_0 ~= nil);
        if l_viewPortBounds_0 then
            local v12 = nil;
            local v13 = l_viewPortBounds_0.max - l_viewPortBounds_0.min;
            v4.assert(v13.X > 0);
            v4.assert(v13.Y > 0);
            v12 = v13 * v9.props.viewFillPercent;
            v13 = v4.assert;
            local v14 = false;
            if v12.X > 0 then
                v14 = v12.Y > 0;
            end;
            v13(v14);
            if not (v12.X > 0) or v12.Y <= 0 then
                return false;
            else
                v13 = v10.AbsolutePosition;
                v14 = v13 + v10.AbsoluteSize / 2;
                local v15 = v13 + v10.AbsoluteSize;
                local v16 = false;
                if l_viewPortBounds_0.min.X < v14.X then
                    v16 = v14.X < l_viewPortBounds_0.max.X;
                end;
                local v17 = false;
                if l_viewPortBounds_0.min.Y < v14.Y then
                    v17 = v14.Y < l_viewPortBounds_0.max.Y;
                end;
                if not v16 or not v17 then
                    local v18 = v15:Min(l_viewPortBounds_0.max) - v13:Max(l_viewPortBounds_0.min);
                    local v19 = v12.X <= v18.X;
                    if not v17 or not v19 then
                        local v20 = v12.Y <= v18.Y;
                        if not v16 or not v20 then
                            if not v19 or not v20 then
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
        else
            return false;
        end;
    else
        return false;
    end;
end;
v7._defaultObjectCollector = function(v21)
    return v21:GetChildren();
end;
v7._calculateImpressions = function(v22)
    if v22.isMounted then
        if not v22.props.pageFilter then
            if v22.props.appPage ~= v22.props.currentPage then
                return ;
            end;
        elseif not v22.props.pageFilter(v22.props.currentPage) then
            return ;
        end;
        local v23 = v22.props.parentRef and v22.props.parentRef.current;
        if v23 and v22:_isInstanceVisible(v23) then
            v22.lastImpressionTick = tick();
            local v24 = {};
            local v25 = (v22.props.collectObjectsFunc or v22._defaultObjectCollector)(v23);
            if v25 then
                for _, v27 in v25, nil, nil do
                    if not ((not v27:isA("GuiObject") or not v22:_isInstanceVisible(v27)) or v22.props.filterImpressionFunc ~= nil and not v22.props.filterImpressionFunc(v27)) then
                        table.insert(v24, v27);
                    end;
                end;
            end;
            if #v24 > 0 then
                v4.assert(v22.props.onImpressionsDetected ~= nil);
                v22.props.onImpressionsDetected(v24);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v7._requestImpressions = function(v28)
    if v28.isMounted then
        if v28.nextImpressionTick ~= nil then
            return ;
        elseif v28.props.parentRef and v28.props.parentRef.current then
            local v29 = 0;
            if v28.lastImpressionTick ~= nil then
                v28.nextImpressionTick = v28.lastImpressionTick + v28.props.scanDebounceSeconds;
                v29 = v28.nextImpressionTick - tick();
            end;
            if v29 > 0 then
                task.delay(v29, function()
                    local l_assert_0 = v4.assert;
                    local v31 = false;
                    if v28.nextImpressionTick ~= nil then
                        v31 = v28.nextImpressionTick < tick();
                    end;
                    l_assert_0(v31);
                    v28.nextImpressionTick = nil;
                    v28:_calculateImpressions();
                end);
                return ;
            else
                v28.nextImpressionTick = nil;
                v28:_calculateImpressions();
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
v7.didMount = function(v33)
    v33.isMounted = true;
    v33:_requestImpressions();
    if v33.props.onRequestImpressionsSignal then
        v33.onRequestImpressionsConnection = v33.props.onRequestImpressionsSignal:connect(function()
            v33:_requestImpressions();
        end);
    end;
end;
v7.willUnmount = function(v34)
    v34.isMounted = false;
    if v34.onRequestImpressionsConnection ~= nil then
        v34.onRequestImpressionsConnection:disconnect();
        v34.onRequestImpressionsConnection = nil;
    end;
end;
v7.didUpdate = function(v35, _, _)
    v35:_requestImpressions();
end;
return (v3.connect(function(v38, _)
    return {
        currentPage = v6(v38)
    };
end)(v7));
