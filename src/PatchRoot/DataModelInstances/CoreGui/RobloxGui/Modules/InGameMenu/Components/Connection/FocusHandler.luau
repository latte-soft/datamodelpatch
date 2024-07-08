local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_Cryo_0 = v0.Cryo;
local v4 = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory);
local v5 = require(script.Parent.FocusHandlerUtils.FocusHandlerContext);
local v6 = 1;
local v7 = l_Roact_0.PureComponent:extend("FocusHandler");
v7.validateProps = l_t_0.strictInterface({
    isFocused = l_t_0.boolean, 
    didFocus = l_t_0.optional(l_t_0.callback), 
    didBlur = l_t_0.optional(l_t_0.callback), 
    shouldForgetPreviousSelection = not not v4() and l_t_0.optional(l_t_0.boolean) or nil, 
    currentHandlerId = not not v4() and l_t_0.optional(l_t_0.number) or nil, 
    candidateHandlerId = not not v4() and l_t_0.optional(l_t_0.number) or nil, 
    previousSelections = not not v4() and l_t_0.table or nil, 
    requestFocusForHandlerId = not not v4() and l_t_0.callback or nil, 
    forgetLastSelectionForHandlerId = not not v4() and l_t_0.callback or nil, 
    blurCurrentFocusHandler = not not v4() and l_t_0.callback or nil, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
if v4() then
    v7.init = function(v8)
        v8.id = v6;
        v6 = v6 + 1;
    end;
end;
v7.render = function(v9)
    return l_Roact_0.createFragment(v9.props[l_Roact_0.Children]);
end;
if not v4() then
    v7.didMount = function(v10)
        if v10.props.isFocused then
            v10.props.didFocus();
        end;
    end;
else
    v7.didMount = function(v11)
        if v11.props.isFocused then
            v11.props.requestFocusForHandlerId(v11.id);
        end;
    end;
end;
if not v4() then
    v7.didUpdate = function(v12, v13)
        if (not v12.props.isFocused or v13.isFocused) or not v12.props.didFocus then
            if not ((v12.props.isFocused or not v13.isFocused) or not v12.props.didBlur) then
                v12.props.didBlur();
            end;
            return ;
        else
            v12.props.didFocus();
            return ;
        end;
    end;
else
    v7.didUpdate = function(v14, v15)
        local v16 = v14.props.shouldForgetPreviousSelection and not v15.shouldForgetPreviousSelection;
        local v17 = v14.props.previousSelections[v14.id];
        if not (not v16 and (not (v17 ~= nil) or v17:IsDescendantOf(game))) then
            v14.props.forgetLastSelectionForHandlerId(v14.id);
            v17 = nil;
        end;
        local v18 = false;
        if v14.props.candidateHandlerId ~= v14.id then
            v18 = v14.props.candidateHandlerId ~= nil;
        end;
        local v19 = false;
        if v15.candidateHandlerId ~= v14.id then
            v19 = v15.candidateHandlerId ~= nil;
        end;
        local v20 = false;
        if v14.props.currentHandlerId == v14.id then
            v20 = v15.currentHandlerId ~= v14.id;
        end;
        local v21 = false;
        if v14.props.currentHandlerId == nil then
            v21 = false;
            if v15.currentHandlerId ~= nil then
                v21 = v15.currentHandlerId ~= v14.id;
            end;
        end;
        local v22 = (v21 and not v18) and v14.props.isFocused;
        local v23 = not v15.isFocused and v14.props.isFocused;
        local v24 = not not v15.isFocused and not v14.props.isFocused or v18 and not v19;
        local v25 = false;
        if v15.currentHandlerId == v14.id then
            v25 = v14.props.currentHandlerId ~= v14.id;
        end;
        if not v23 and not v22 then
            if not (not v20 or not v14.props.didFocus) then
                v14.props.didFocus(v17);
            end;
        else
            v14.props.requestFocusForHandlerId(v14.id);
        end;
        if v24 and v14.props.currentHandlerId == v14.id then
            v14.props.blurCurrentFocusHandler(v14.id, v14.props.shouldForgetPreviousSelection);
        end;
        if not (not v25 or not v14.props.didBlur) then
            v14.props.didBlur();
        end;
    end;
end;
if not v4() then
    v7.willUnmount = function(v26)
        if not (not v26.props.isFocused or not v26.props.didBlur) then
            v26.props.didBlur();
        end;
    end;
else
    v7.willUnmount = function(v27)
        if not v27.props.isFocused then
            v27.props.forgetLastSelectionForHandlerId(v27.id);
        else
            v27.props.blurCurrentFocusHandler(v27.id, true);
            if v27.props.didBlur then
                v27.props.didBlur();
                return ;
            end;
        end;
    end;
end;
if not v4() then
    return v7;
else
    return function(v28)
        return l_Roact_0.createElement(v5.Consumer, {
            render = function(v29)
                return l_Roact_0.createElement(v7, l_Cryo_0.Dictionary.join(v28, {
                    currentHandlerId = v29.currentHandlerId, 
                    previousSelections = v29.previousSelections, 
                    requestFocusForHandlerId = v29.requestFocusForHandlerId, 
                    forgetLastSelectionForHandlerId = v29.forgetLastSelectionForHandlerId, 
                    blurCurrentFocusHandler = v29.blurCurrentFocusHandler, 
                    candidateHandlerId = v29.candidateHandlerId
                }));
            end
        });
    end;
end;
