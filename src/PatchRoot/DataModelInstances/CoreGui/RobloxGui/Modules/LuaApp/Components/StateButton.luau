local v0 = require(game:GetService("CorePackages").Roact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.LuaApp.Enum.ButtonState);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v5 = require(l_Modules_0.LuaApp.StateTable);
local v6 = v0.PureComponent:extend("StateButton");
v6.init = function(v7)
    v7.state = {
        currentState = v3.Default
    };
    v7.id = "StateButton" .. tostring(v7);
    v7.stateTable = v5.new(v7.id, v3.Default, {}, {
        [v3.Default] = {
            OnPressed = {
                nextState = v3.Pressed
            }, 
            StartHover = {
                nextState = v3.Hover
            }, 
            OnSelectionGained = {
                nextState = v3.Selected
            }, 
            Disable = {
                nextState = v3.Disabled
            }
        }, 
        [v3.Hover] = {
            OnSelectionGained = {
                nextState = v3.Selected
            }, 
            OnPressed = {
                nextState = v3.Pressed
            }, 
            EndHover = {
                nextState = v3.Default
            }, 
            Disable = {
                nextState = v3.Disabled
            }
        }, 
        [v3.Pressed] = {
            OnSelectionGained = {
                nextState = v3.SelectedPressed
            }, 
            OnReleased = {
                nextState = v3.Default
            }, 
            OnReleasedHover = {
                nextState = v3.Hover
            }, 
            Disable = {
                nextState = v3.Disabled
            }
        }, 
        [v3.Selected] = {
            OnSelectionLost = {
                nextState = v3.Default
            }, 
            OnPressed = {
                nextState = v3.SelectedPressed
            }, 
            Disable = {
                nextState = v3.Disabled
            }
        }, 
        [v3.SelectedPressed] = {
            OnSelectionLost = {
                nextState = v3.Default
            }, 
            OnReleased = {
                nextState = v3.Selected
            }, 
            Disable = {
                nextState = v3.Disabled
            }
        }, 
        [v3.Disabled] = {
            Enable = {
                nextState = v3.Default
            }
        }
    });
    v7.stateTable:onStateChange(function(v8, v9, _)
        v7:setState({
            currentState = v9
        });
        if v7.props.StateChanged then
            v7.props.StateChanged(v8, v9);
        end;
    end);
end;
v6.render = function(v11)
    local l_props_0 = v11.props;
    local v13 = v2.RemoveFromDictionary(v11.props, "Disabled", "StateChanged", v0.Event.Activated);
    v13.Selectable = true;
    v13[v0.Event.MouseEnter] = function(...)
        v11.stateTable.events.StartHover();
        if l_props_0[v0.Event.MouseEnter] ~= nil then
            return l_props_0[v0.Event.MouseEnter](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.MouseLeave] = function(...)
        v11.stateTable.events.EndHover();
        if l_props_0[v0.Event.MouseLeave] ~= nil then
            return l_props_0[v0.Event.MouseLeave](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.InputBegan] = function(...)
        local v14 = select(2, ...);
        if not (v14.UserInputType ~= Enum.UserInputType.MouseButton1 and v14.UserInputType ~= Enum.UserInputType.Touch) or v14.KeyCode == Enum.KeyCode.ButtonA then
            v11.stateTable.events.OnPressed();
        end;
        if l_props_0[v0.Event.InputBegan] ~= nil then
            return l_props_0[v0.Event.InputBegan](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.InputEnded] = function(...)
        local v15 = select(2, ...);
        if v15.UserInputType == Enum.UserInputType.MouseButton1 then
            v11.stateTable.events.OnReleasedHover();
        elseif not (v15.UserInputType ~= Enum.UserInputType.Touch and v15.KeyCode ~= Enum.KeyCode.ButtonA) or v15.UserInputType == Enum.UserInputType.MouseMovement then
            v11.stateTable.events.OnReleased();
        end;
        if l_props_0[v0.Event.InputEnded] ~= nil then
            return l_props_0[v0.Event.InputEnded](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.SelectionGained] = function(...)
        v11.stateTable.events.OnSelectionGained();
        if l_props_0[v0.Event.SelectionGained] ~= nil then
            return l_props_0[v0.Event.SelectionGained](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.SelectionLost] = function(...)
        v11.stateTable.events.OnSelectionLost();
        if l_props_0[v0.Event.SelectionLost] ~= nil then
            return l_props_0[v0.Event.SelectionLost](...);
        else
            return ;
        end;
    end;
    v13[v0.Event.Activated] = function(...)
        if v11.state ~= v3.Disabled and v11.props[v0.Event.Activated] ~= nil then
            return v11.props[v0.Event.Activated](...);
        else
            return ;
        end;
    end;
    return v0.createElement(v4, v13);
end;
v6.didUpdate = function(v16, v17, _)
    if v16.props.Disabled ~= v17.Disabled then
        if not v16.props.Disabled then
            v16.stateTable.events.Enable();
        else
            v16.stateTable.events.Disable();
            return ;
        end;
    end;
end;
return v6;
