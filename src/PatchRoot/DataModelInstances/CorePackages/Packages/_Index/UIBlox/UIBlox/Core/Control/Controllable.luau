local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.Enum.ControlState);
local v7 = require(l_Parent_1.StateTable.StateTable);
local v8 = v3.PureComponent:extend("Controllable");
v8.init = function(v9)
    v9.isMounted = false;
    local l_Initialize_0 = v6.Initialize;
    v9.state = {
        currentState = l_Initialize_0
    };
    local v11 = string.format("Controllable(%s)", (tostring(v9)));
    v9.setDisabled = function(v12)
        if not v12 then
            v9.stateTable.events.Enable();
            return ;
        else
            v9.stateTable.events.Disable();
            return ;
        end;
    end;
    v9.stateTable = v7.new(v11, l_Initialize_0, {}, {
        [v6.Initialize] = {
            Enable = {
                nextState = v6.Default
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.Default] = {
            OnPressed = {
                nextState = v6.Pressed
            }, 
            StartHover = {
                nextState = v6.Hover
            }, 
            OnSelectionGained = {
                nextState = v6.Selected
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.Hover] = {
            OnSelectionGained = {
                nextState = v6.Selected
            }, 
            OnPressed = {
                nextState = v6.Pressed
            }, 
            EndHover = {
                nextState = v6.Default
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.Pressed] = {
            OnSelectionGained = {
                nextState = v6.SelectedPressed
            }, 
            OnReleased = {
                nextState = v6.Default
            }, 
            OnReleasedHover = {
                nextState = v6.Hover
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.Selected] = {
            OnSelectionLost = {
                nextState = v6.Default
            }, 
            OnPressed = {
                nextState = v6.SelectedPressed
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.SelectedPressed] = {
            OnSelectionLost = {
                nextState = v6.Default
            }, 
            OnReleased = {
                nextState = v6.Selected
            }, 
            Disable = {
                nextState = v6.Disabled
            }
        }, 
        [v6.Disabled] = {
            Enable = {
                nextState = v6.Default
            }
        }
    });
    v9.stateTable:onStateChange(function(v13, v14)
        v9:setState({
            currentState = v14
        });
        if v9.props.onStateChanged then
            v9.props.onStateChanged(v13, v14);
        end;
    end);
end;
v8.validateProps = v5.strictInterface({
    controlComponent = v5.strictInterface({
        component = v5.union(v5.callback, v5.string, v5.table), 
        props = v5.optional(v5.table), 
        children = v5.optional(v5.table)
    }), 
    onStateChanged = v5.callback, 
    isDisabled = v5.optional(v5.boolean), 
    userInteractionEnabled = v5.optional(v5.boolean)
});
v8.defaultProps = {
    userInteractionEnabled = true, 
    isDisabled = false
};
v8.render = function(v15)
    local l_controlComponent_0 = v15.props.controlComponent;
    local l_userInteractionEnabled_0 = v15.props.userInteractionEnabled;
    if v15.state.currentState == v6.Initialize then
        return nil;
    else
        local v18 = l_controlComponent_0.props and l_controlComponent_0.props.Selectable;
        if v18 == nil then
            v18 = true;
        end;
        return v3.createElement(l_controlComponent_0.component, v4.Dictionary.join(v15.props, l_controlComponent_0.props or {}, {
            Selectable = v18, 
            Active = not v15.props.isDisabled, 
            [v3.Event.MouseEnter] = function(...)
                if l_userInteractionEnabled_0 then
                    v15.stateTable.events.StartHover();
                    if l_controlComponent_0.props[v3.Event.MouseEnter] ~= nil then
                        return l_controlComponent_0.props[v3.Event.MouseEnter](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.MouseLeave] = function(...)
                if l_userInteractionEnabled_0 then
                    v15.stateTable.events.EndHover();
                    if l_controlComponent_0.props[v3.Event.MouseLeave] ~= nil then
                        return l_controlComponent_0.props[v3.Event.MouseLeave](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.InputBegan] = function(...)
                if l_userInteractionEnabled_0 then
                    local v19 = select(2, ...);
                    if not (v19.UserInputType ~= Enum.UserInputType.MouseButton1 and v19.UserInputType ~= Enum.UserInputType.Touch) or v19.KeyCode == Enum.KeyCode.ButtonA then
                        v15.stateTable.events.OnPressed();
                    end;
                    if l_controlComponent_0.props[v3.Event.InputBegan] ~= nil then
                        return l_controlComponent_0.props[v3.Event.InputBegan](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.InputEnded] = function(...)
                if l_userInteractionEnabled_0 then
                    local v20 = select(2, ...);
                    if v20.UserInputType == Enum.UserInputType.MouseButton1 then
                        v15.stateTable.events.OnReleasedHover();
                    elseif not (v20.UserInputType ~= Enum.UserInputType.Touch and v20.KeyCode ~= Enum.KeyCode.ButtonA) or v20.UserInputType == Enum.UserInputType.MouseMovement then
                        v15.stateTable.events.OnReleased();
                    end;
                    if l_controlComponent_0.props[v3.Event.InputEnded] ~= nil then
                        return l_controlComponent_0.props[v3.Event.InputEnded](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.SelectionGained] = function(...)
                if l_userInteractionEnabled_0 then
                    v15.stateTable.events.OnSelectionGained();
                    if l_controlComponent_0.props[v3.Event.SelectionGained] ~= nil then
                        return l_controlComponent_0.props[v3.Event.SelectionGained](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.SelectionLost] = function(...)
                if l_userInteractionEnabled_0 then
                    v15.stateTable.events.OnSelectionLost();
                    if l_controlComponent_0.props[v3.Event.SelectionLost] ~= nil then
                        return l_controlComponent_0.props[v3.Event.SelectionLost](...);
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Event.Activated] = function(...)
                if l_userInteractionEnabled_0 then
                    if not (l_controlComponent_0.props[v3.Event.Activated] and v15.state.currentState ~= v6.Disabled) or not v15.isMounted then
                        return nil;
                    else
                        return l_controlComponent_0.props[v3.Event.Activated](...);
                    end;
                else
                    return nil;
                end;
            end, 
            [v3.Ref] = l_controlComponent_0.props.forwardedRef, 
            forwardedRef = v4.None, 
            userInteractionEnabled = v4.None, 
            isDisabled = v4.None, 
            onStateChanged = v4.None, 
            [v3.Children] = v4.None, 
            controlComponent = v4.None
        }), l_controlComponent_0.children);
    end;
end;
v8.didMount = function(v21)
    v21.isMounted = true;
    v21.setDisabled(v21.props.isDisabled);
end;
v8.didUpdate = function(v22, v23)
    if v22.props.isDisabled ~= v23.isDisabled then
        v22.setDisabled(v22.props.isDisabled);
    end;
end;
v8.willUnmount = function(v24)
    v24.isMounted = false;
end;
return v8;
