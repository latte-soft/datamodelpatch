local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v5 = require(l_Context_0.GameInviteModalLayoutContext);
local function _()
    if not l_GuiService_0 then
        return 50;
    else
        return l_GuiService_0:GetGuiInset().Y;
    end;
end;
local function _()
    return workspace.CurrentCamera.ViewportSize;
end;
local function _(v8)
    return v8 < 800;
end;
local function _(v10)
    return v10 < 624;
end;
local function _(v12)
    return (v12.X < 800 or v12.Y < 624) and v12.X or 800;
end;
local function _(v14)
    return (v14.X < 800 or v14.Y < 624) and v14.Y - (not l_GuiService_0 and 50 or l_GuiService_0:GetGuiInset().Y) or 624;
end;
local function v17(v16)
    return UDim2.new(UDim.new(0, (v16.X < 800 or v16.Y < 624) and v16.X or 800), (UDim.new(0, (v16.X < 800 or v16.Y < 624) and v16.Y - (not l_GuiService_0 and 50 or l_GuiService_0:GetGuiInset().Y) or 624)));
end;
local function _(v18)
    if not (v18.X < 800) and not (v18.Y < 624) then
        return "default";
    else
        return "compact";
    end;
end;
return function(v20)
    local v21, v22 = v3.useState(v17(workspace.CurrentCamera.ViewportSize));
    local v23, v24 = v3.useState(workspace.CurrentCamera.ViewportSize.Y < 624);
    local v25, v26 = v3.useState(workspace.CurrentCamera.ViewportSize.X < 800);
    local l_useState_0 = v3.useState;
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    local v29;
    l_useState_0, v29 = l_useState_0((l_ViewportSize_0.X < 800 or l_ViewportSize_0.Y < 624) and "compact" or "default");
    l_ViewportSize_0 = function()
        local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
        local v31 = l_ViewportSize_1.Y < 624;
        local v32 = l_ViewportSize_1.X < 800;
        local v33 = UDim2.new(UDim.new(0, (l_ViewportSize_1.X < 800 or l_ViewportSize_1.Y < 624) and l_ViewportSize_1.X or 800), (UDim.new(0, (l_ViewportSize_1.X < 800 or l_ViewportSize_1.Y < 624) and l_ViewportSize_1.Y - (not l_GuiService_0 and 50 or l_GuiService_0:GetGuiInset().Y) or 624)));
        v24(v31);
        v26(v32);
        v22(v33);
        v29((l_ViewportSize_1.X < 800 or l_ViewportSize_1.Y < 624) and "compact" or "default");
    end;
    v3.useEffect(function()
        l_ViewportSize_0();
        local v34 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(l_ViewportSize_0);
        return function()
            if v34 then
                v34:Disconnect();
            end;
        end;
    end, {});
    return v3.createElement(v5.Provider, {
        value = {
            isFullHeight = v23, 
            isFullWidth = v25, 
            modalSize = v21, 
            modalMode = l_useState_0
        }
    }, v20.children);
end;
