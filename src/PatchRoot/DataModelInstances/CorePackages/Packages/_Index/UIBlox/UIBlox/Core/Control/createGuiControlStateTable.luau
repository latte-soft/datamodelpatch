local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.Enum.ControlState);
local v3 = require(l_Parent_0.Enum.ControlStateEvent);
local v4 = require(l_Parent_1.StateTable.StateTable);
return function(v5)
    local v6 = nil;
    v6 = v4.new("GuiStateTable", v2.Initialize, {}, {
        [v2.Initialize] = {
            [v3.Idle] = {
                nextState = v2.Default
            }, 
            [v3.Enabled] = {
                nextState = v2.Default
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.Default] = {
            [v3.PrimaryPressed] = {
                nextState = v2.Pressed
            }, 
            [v3.PointerHover] = {
                nextState = v2.Hover
            }, 
            [v3.SelectionGained] = {
                nextState = v2.Selected
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.Hover] = {
            [v3.SelectionGained] = {
                nextState = v2.Selected
            }, 
            [v3.PrimaryPressed] = {
                nextState = v2.Pressed
            }, 
            [v3.PointerHoverEnd] = {
                nextState = v2.Default
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.Pressed] = {
            [v3.SelectionGained] = {
                nextState = v2.SelectedPressed
            }, 
            [v3.PrimaryReleasedHover] = {
                nextState = v2.Hover
            }, 
            [v3.PrimaryReleased] = {
                nextState = v2.Default
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.Selected] = {
            [v3.SelectionLost] = {
                nextState = v2.Default
            }, 
            [v3.PrimaryPressed] = {
                nextState = v2.SelectedPressed
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.SelectedPressed] = {
            [v3.SelectionLost] = {
                nextState = v2.Default
            }, 
            [v3.PrimaryReleasedHover] = {
                nextState = v2.Selected
            }, 
            [v3.PrimaryReleased] = {
                nextState = v2.Selected
            }, 
            [v3.Disabled] = {
                nextState = v2.Disabled
            }
        }, 
        [v2.Disabled] = {
            [v3.Enabled] = {
                nextState = v2.Default
            }
        }
    });
    v6:onStateChange(v5);
    return v6;
end;
