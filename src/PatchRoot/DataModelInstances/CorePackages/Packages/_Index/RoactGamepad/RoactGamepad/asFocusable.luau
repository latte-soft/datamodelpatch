local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.FocusContext);
local v5 = require(script.Parent.FocusNode);
local v6 = require(script.Parent.getEngineInterface);
local v7 = require(script.Parent.FocusControllerInternalApi);
local v8 = {
    parentFocusNode = v2.None, 
    parentNeighbors = v2.None, 
    focusController = v2.None, 
    onFocusGained = v2.None, 
    onFocusLost = v2.None, 
    onFocusChanged = v2.None, 
    inputBindings = v2.None, 
    innerRef = v2.None, 
    restorePreviousChildFocus = v2.None, 
    defaultChild = v2.None
};
local v9 = {};
local v11 = v3.intersection(v3.interface({
    parentFocusNode = v3.optional(v3.table), 
    focusController = v3.optional(v3.table), 
    innerRef = v3.optional(v3.table), 
    restorePreviousChildFocus = v3.boolean, 
    inputBindings = v3.table, 
    defaultChild = v3.optional(v3.table), 
    onFocusGained = v3.optional(v3.callback), 
    onFocusLost = v3.optional(v3.callback), 
    onFocusChanged = v3.optional(v3.callback)
}), function(v10)
    if v10.focusController ~= nil and v10.parentFocusNode ~= nil then
        return false, "Cannot attach a new focusController beneath an existing one";
    else
        return true;
    end;
end);
local v12 = {
    restorePreviousChildFocus = false, 
    inputBindings = {}
};
return function(v13)
    local v14 = v1.Component:extend((("Focusable(%s)"):format((tostring(v13)))));
    v14.validateProps = v11;
    v14.defaultProps = v12;
    v14.init = function(v15)
        v15.focused = false;
        v15.defaultRef = v1.createRef();
        local v16 = v15.props.parentNeighbors or v9;
        v15:setState({
            focusNode = v5.new(v15.props, v15:getRef()), 
            parentNeighbors = v16, 
            neighbors = {
                NextSelectionLeft = v15.props.NextSelectionLeft or v16.NextSelectionLeft, 
                NextSelectionRight = v15.props.NextSelectionRight or v16.NextSelectionRight, 
                NextSelectionUp = v15.props.NextSelectionUp or v16.NextSelectionUp, 
                NextSelectionDown = v15.props.NextSelectionDown or v16.NextSelectionDown
            }, 
            needsDescendantAddedRefocusCounter = 0, 
            needsDescendantRemovedRefocusCounter = 0
        });
        v15.updateFocusedState = function(v17)
            if v15.focused or not v17 then
                if not (not v15.focused or v17) then
                    v15:loseFocus();
                end;
                return ;
            else
                v15:gainFocus();
                return ;
            end;
        end;
        if v15:isRoot() then
            local v18 = false;
            do
                local l_v18_0 = v18;
                v15.ancestryChanged = function(v20)
                    if not (l_v18_0 or not v20:IsDescendantOf(game)) then
                        l_v18_0 = true;
                        v15:getFocusControllerInternal():initialize(v6(v20));
                    end;
                end;
                v15.ancestryChangedListener = function(v21)
                    v15.ancestryChanged(v21);
                    local v22 = v15.props[v1.Event.AncestryChanged];
                    if v22 ~= nil then
                        v22(v21);
                    end;
                end;
                v15.refreshFocusOnDescendantAdded = function(v23)
                    if v15:getFocusControllerInternal():needsDescendantAddedRefocus() then
                        v15:setState(function(v24)
                            return {
                                needsDescendantAddedRefocusCounter = v24.needsDescendantAddedRefocusCounter + 1
                            };
                        end);
                    end;
                    local v25 = v15.props[v1.Event.DescendantAdded];
                    if v25 ~= nil then
                        v25(v23);
                    end;
                end;
                v15.refreshFocusOnDescendantRemoved = function(v26)
                    if v15:getFocusControllerInternal():needsDescendantRemovedRefocus() then
                        v15:setState(function(v27)
                            return {
                                needsDescendantRemovedRefocusCounter = v27.needsDescendantRemovedRefocusCounter + 1
                            };
                        end);
                    end;
                    local v28 = v15.props[v1.Event.DescendantRemoving];
                    if v28 ~= nil then
                        v28(v26);
                    end;
                end;
            end;
        end;
    end;
    v14.getDerivedStateFromProps = function(v29, v30)
        local v31 = v30.neighbors or v9;
        local v32 = v29.parentNeighbors or v9;
        local v33 = v29.NextSelectionLeft or v32.NextSelectionLeft;
        local v34 = v29.NextSelectionRight or v32.NextSelectionRight;
        local v35 = v29.NextSelectionUp or v32.NextSelectionUp;
        local v36 = v29.NextSelectionDown or v32.NextSelectionDown;
        if not ((v33 == v31.NextSelectionLeft and v34 == v31.NextSelectionRight) and v36 == v31.NextSelectionDown) or v35 ~= v31.NextSelectionUp then
            return {
                parentNeighbors = v32, 
                neighbors = {
                    NextSelectionLeft = v33, 
                    NextSelectionRight = v34, 
                    NextSelectionUp = v35, 
                    NextSelectionDown = v36
                }
            };
        else
            return nil;
        end;
    end;
    v14.gainFocus = function(v37)
        v37.focused = true;
        if v37.props.onFocusGained ~= nil then
            v37.props.onFocusGained();
        end;
        if v37.props.onFocusChanged ~= nil then
            v37.props.onFocusChanged(true);
        end;
    end;
    v14.loseFocus = function(v38)
        v38.focused = false;
        if v38.props.onFocusLost ~= nil then
            v38.props.onFocusLost();
        end;
        if v38.props.onFocusChanged ~= nil then
            v38.props.onFocusChanged(false);
        end;
    end;
    v14.isRoot = function(v39)
        local v40 = false;
        if v39.props.focusController ~= nil then
            v40 = v39.props.parentFocusNode == nil;
        end;
        return v40;
    end;
    v14.getFocusControllerInternal = function(v41)
        return v41.state.focusNode.focusController[v7];
    end;
    v14.getRef = function(v42)
        return v42.props.innerRef or v42.defaultRef;
    end;
    v14.render = function(v43)
        local v44 = v43:getRef();
        local v45 = {
            NextSelectionLeft = v44, 
            NextSelectionRight = v44, 
            NextSelectionDown = v44, 
            NextSelectionUp = v44, 
            [v1.Ref] = v44
        };
        local _ = nil;
        return v1.createElement(v4.Provider, {
            value = v43.state
        }, v1.createElement(v13, if not v43:isRoot() then v2.Dictionary.join(v45, v43.props.parentNeighbors or v9, v43.props, v8) else v2.Dictionary.join(v45, v43.props, {
            [v1.Event.AncestryChanged] = v43.ancestryChangedListener, 
            [v1.Event.DescendantAdded] = v43.refreshFocusOnDescendantAdded, 
            [v1.Event.DescendantRemoving] = v43.refreshFocusOnDescendantRemoved
        }, v8)));
    end;
    v14.didMount = function(v47)
        v47.state.focusNode:attachToTree(v47.props.parentFocusNode, v47.updateFocusedState);
        if v47:isRoot() then
            v47.ancestryChanged(v47:getRef():getValue());
        end;
    end;
    v14.didUpdate = function(v48, _, v50)
        v48.state.focusNode:updateNavProps(v48.props);
        if v48.state.focusNode.ref ~= (v48.props.innerRef or v48.defaultRef) then
            error("Cannot change the ref passed to a Focusable component", 0);
        end;
        if v48.state.needsDescendantAddedRefocusCounter ~= v50.needsDescendantAddedRefocusCounter then
            v48:getFocusControllerInternal():descendantAddedRefocus();
        end;
        if v48.state.needsDescendantRemovedRefocusCounter ~= v50.needsDescendantRemovedRefocusCounter then
            v48:getFocusControllerInternal():descendantRemovedRefocus();
        end;
    end;
    v14.willUnmount = function(v51)
        v51.state.focusNode:detachFromTree();
        if v51:isRoot() then
            v51:getFocusControllerInternal():teardown();
        end;
    end;
    return v1.forwardRef(function(v52, v53)
        return v1.createElement(v4.Consumer, {
            render = function(v54)
                if v54 == nil and v52.focusController == nil then
                    return v1.createElement(v13, (v2.Dictionary.join(v52, v8, {
                        [v1.Ref] = v53
                    })));
                else
                    return v1.createElement(v14, (v2.Dictionary.join(v52, {
                        parentFocusNode = not not v54 and v54.focusNode or nil, 
                        parentNeighbors = not not v54 and v54.neighbors or nil, 
                        innerRef = v53
                    })));
                end;
            end
        });
    end);
end;
