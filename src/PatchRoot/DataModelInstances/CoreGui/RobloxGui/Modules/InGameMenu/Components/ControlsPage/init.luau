local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Controls);
local v9 = require(script.ControlLayouts.KeyboardControls);
local v10 = require(script.ControlLayouts.GamepadControls);
local v11 = require(script.ControlLayouts.VRGamepadControls);
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v13 = require(l_RobloxGui_0.Modules.VR.VRUtil);
local v14 = require(l_RobloxGui_0.Modules.VR.VRServiceWrapper);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = l_Roact_0.PureComponent:extend("ControlsPage");
v16.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string, 
    controlLayout = l_t_0.optional(l_t_0.string), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v16.init = function(v17)
    v17.closeButtonRef = l_Roact_0.createRef();
end;
v16.render = function(v18)
    local l_controlLayout_0 = v18.props.controlLayout;
    if l_controlLayout_0 == v8.ControlLayouts.KEYBOARD then
        return l_Roact_0.createElement(v9);
    elseif l_controlLayout_0 == v8.ControlLayouts.GAMEPAD then
        if v14.VREnabled and v13.getCurrentControllerType() == "Touch" then
            return l_Roact_0.createElement(v11);
        else
            return l_Roact_0.createFragment({
                GamepadControls = l_Roact_0.createElement(v10, {
                    closeButtonRef = v18.closeButtonRef
                }), 
                FocusHandler = l_Roact_0.createElement(v15, {
                    isFocused = v18.props.canCaptureFocus, 
                    didFocus = function()
                        local v20 = v18.closeButtonRef:getValue();
                        l_GuiService_0:AddSelectionParent("IGMControlsPage_CloseButtonSelectionGroup", v20);
                        l_GuiService_0.SelectedCoreObject = v20;
                    end, 
                    didBlur = function()
                        l_GuiService_0:RemoveSelectionGroup("IGMControlsPage_CloseButtonSelectionGroup");
                    end
                })
            });
        end;
    else
        return nil;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v21)
    return {
        controlLayout = v21.controlLayout, 
        canCaptureFocus = v21.menuPage == "Controls"
    };
end)(v16);
