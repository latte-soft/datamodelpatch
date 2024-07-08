local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Workspace_0 = game:GetService("Workspace");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.LuaApp.Actions.SetScreenSize);
local v12 = require(l_Modules_0.LuaApp.Actions.SetGlobalGuiInset);
local v13 = require(l_Modules_0.LuaApp.Actions.SetDeviceOrientation);
local l_SetFormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Actions.SetFormFactor;
local v15 = v5.Component:extend("AvatarExperienceViewportListener");
v15.init = function(v16)
    local l_l_GuiService_0_GuiInset_0, v18 = l_GuiService_0:GetGuiInset();
    v16.props.setGlobalGuiInset(l_l_GuiService_0_GuiInset_0.X, l_l_GuiService_0_GuiInset_0.Y, v18.X, v18.Y);
    v16.updateDeviceOrientation = function(v19)
        local v20 = v19.y < v19.x and l_DeviceOrientationMode_0.Landscape or l_DeviceOrientationMode_0.Portrait;
        if v16.props.deviceOrientation ~= v20 then
            v16.props.setDeviceOrientation(v20);
        end;
    end;
    v16.updateDeviceFormFactor = function(v21)
        local l_useWidthBasedRule_0 = v16.props.useWidthBasedRule;
        local l_WIDE_0 = l_FormFactor_0.WIDE;
        if not l_useWidthBasedRule_0 then
            if v21.X < v21.Y then
                l_WIDE_0 = l_FormFactor_0.COMPACT;
            end;
        elseif v21.X < 600 then
            l_WIDE_0 = l_FormFactor_0.COMPACT;
        end;
        v16.props.setFormFactor(l_WIDE_0);
    end;
    v16.updateViewport = function()
        local l_ViewportSize_0 = l_Workspace_0.CurrentCamera.ViewportSize;
        if l_ViewportSize_0.X > 1 and l_ViewportSize_0.Y > 1 then
            v16.props.setScreenSize(l_ViewportSize_0);
            v16.updateDeviceOrientation(l_ViewportSize_0);
            v16.updateDeviceFormFactor(l_ViewportSize_0);
        end;
    end;
end;
v15.render = function(v25)
    return v5.createElement("Folder", {}, {
        viewportSizeListener = v5.createElement(l_ExternalEventConnection_0, {
            event = l_Workspace_0.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = v25.updateViewport
        })
    });
end;
v15.didMount = function(v26)
    v26.updateViewport();
end;
return (l_RoactAppPolicy_0.connect(function(v27, _)
    return {
        useWidthBasedRule = v27.getUseWidthBasedFormFactorRule()
    };
end)((v6.connect(function(v29)
    return {
        deviceOrientation = v29.DeviceOrientation
    };
end, function(v30)
    return {
        setScreenSize = function(v31)
            v30(v11(v31));
        end, 
        setGlobalGuiInset = function(v32, v33, v34, v35)
            return v30(v12(v32, v33, v34, v35));
        end, 
        setDeviceOrientation = function(v36)
            v30(v13(v36));
        end, 
        setFormFactor = function(v37)
            v30(l_SetFormFactor_0(v37));
        end
    };
end)(v15))));
