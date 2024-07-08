local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = v0.PureComponent:extend("RedirectComponent");
local l_ButtonB_0 = Enum.KeyCode.ButtonB;
local function v5(v4)
    v4.exitActionName = "ExitSection" .. v4.Key;
    l_ContextActionService_0:UnbindCoreAction(v4.exitActionName);
    if not v4.props.ActionPriority then
        l_ContextActionService_0:BindCoreAction(v4.exitActionName, v4.exitAction, false, l_ButtonB_0);
        return ;
    else
        l_ContextActionService_0:BindCoreActionAtPriority(v4.exitActionName, v4.exitAction, false, 2000 + v4.props.ActionPriority, l_ButtonB_0);
        return ;
    end;
end;
local function _(v6)
    if v6.exitActionName ~= nil then
        l_ContextActionService_0:UnbindCoreAction(v6.exitActionName);
        v6.exitActionName = nil;
    end;
end;
v2.init = function(v8)
    v8.Key = v8.props.StringKey or "RedirectComponent";
    v8.exitActionName = nil;
    v8.backPressed = false;
    v8.exitAction = function(_, v10, _)
        if v8.props.InFocus then
            if v10 == Enum.UserInputState.Begin then
                v8.backPressed = true;
                return ;
            else
                if not (not (v10 == Enum.UserInputState.End) or not v8.backPressed) then
                    v8.backPressed = false;
                    v8.props.RedirectBack();
                end;
                return ;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end;
end;
v2.render = function(v12)
    local l_props_0 = v12.props;
    local v14 = l_props_0.Scale or Vector2.new(1, 1);
    if not l_props_0.InFocus or not l_props_0.RedirectBack then
        if v12.exitActionName ~= nil then
            l_ContextActionService_0:UnbindCoreAction(v12.exitActionName);
            v12.exitActionName = nil;
        end;
    else
        v5(v12);
    end;
    local v15 = nil;
    if not (not l_props_0.InFocus or not l_props_0.RedirectLeft) then
        v15 = v0.createElement("TextButton", {
            Position = UDim2.new(-v14.X / 2, -1, 0.5, 0), 
            Size = UDim2.new(0, 2, 1 + v14.Y, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v0.Event.SelectionGained] = function(v16)
                l_props_0.RedirectLeft(v16);
            end
        });
    end;
    local v17 = nil;
    if not (not l_props_0.InFocus or not l_props_0.RedirectRight) then
        v17 = v0.createElement("TextButton", {
            Position = UDim2.new(1 + v14.X / 2, 1, 0.5, 0), 
            Size = UDim2.new(0, 2, 1 + v14.Y, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v0.Event.SelectionGained] = function(v18)
                l_props_0.RedirectRight(v18);
            end
        });
    end;
    local v19 = nil;
    if not (not l_props_0.InFocus or not l_props_0.RedirectUp) then
        v19 = v0.createElement("TextButton", {
            Position = UDim2.new(0.5, 0, -v14.Y / 2, -1), 
            Size = UDim2.new(1 + v14.X, 0, 0, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v0.Event.SelectionGained] = function(v20)
                l_props_0.RedirectUp(v20);
            end
        });
    end;
    local v21 = nil;
    if not (not l_props_0.InFocus or not l_props_0.RedirectDown) then
        v21 = v0.createElement("TextButton", {
            Position = UDim2.new(0.5, 0, 1 + v14.Y / 2, 1), 
            Size = UDim2.new(1 + v14.X, 0, 0, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v0.Event.SelectionGained] = function(v22)
                l_props_0.RedirectDown(v22);
            end
        });
    end;
    return v0.createElement("ScrollingFrame", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Selectable = false, 
        ScrollingEnabled = false, 
        ScrollBarThickness = 0, 
        CanvasSize = UDim2.new(0, 0, 1, 0)
    }, {
        RedirectLeftButton = v15, 
        RedirectRightButton = v17, 
        RedirectUpButton = v19, 
        RedirectDownButton = v21
    });
end;
v2.willUnmount = function(v23)
    if v23.exitActionName ~= nil then
        l_ContextActionService_0:UnbindCoreAction(v23.exitActionName);
        v23.exitActionName = nil;
    end;
end;
return v2;
