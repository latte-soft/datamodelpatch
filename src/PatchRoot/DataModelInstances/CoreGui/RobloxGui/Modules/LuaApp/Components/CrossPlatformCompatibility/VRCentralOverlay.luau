local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppPanel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).AppPanel3D;
local l_Panel3D_0 = v4.Core.VR.Panel3D;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local l_GetFFlagAdjustVRFloor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAdjustVRFloor;
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local l_OverlayComponent_0 = require(l_Modules_0.LuaApp.Components.CentralOverlayUtils).OverlayComponent;
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v15 = if not l_GetFFlagAdjustVRFloor_0() then l_Panel3D_0 else l_AppPanel3D_0;
local v16 = {
    hideCentralOverlay = false
};
local function v18(v17)
    return v17.CentralOverlay.OverlayType;
end;
local function v20(v19)
    return v19.CentralOverlay.Arguments;
end;
local function v22(v21)
    return v21.ScreenSize;
end;
return function(v23)
    local v24 = l_Object_0.assign({}, v16, v23);
    local v25 = l_useSelector_0(v18);
    local v26 = l_OverlayComponent_0[v25];
    local v27 = l_useSelector_0(v20);
    local v28 = l_useSelector_0(v22);
    local v29 = l_useDispatch_0();
    local v30 = v2.useCallback(function()
        v29(v14());
    end);
    v2.useEffect(function()
        if not v25 then
            v30();
        end;
    end, {
        v25 or false
    });
    local v31 = v2.createElement(v26, l_Object_0.assign({}, v27, {
        containerWidth = v28.X
    }));
    if v24.hideCentralOverlay or not v26 then
        return nil;
    else
        return v2.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            VRCentralOverlay = v2.createElement(v15, {
                partSize = Vector2.new(l_VRConstants_0.MainScreenSize.X * 1.2, l_VRConstants_0.MainScreenSize.Y), 
                offset = if not l_GetFFlagAdjustVRFloor_0() then CFrame.lookAt(l_VRConstants_0.CentralOverlayPosition, l_VRConstants_0.DefaultCameraPosition) else l_VRConstants_0.CentralOverlayPosition, 
                virtualScreenSize = Vector2.new(v28.X * 1.2, v28.Y), 
                panelName = "CentralOverlay", 
                curvature = l_VRConstants_0.MainScreenCurvature
            }, {
                TextButtonWrapper = v2.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Selectable = false
                }, {
                    OverlayComponent = v31
                })
            })
        });
    end;
end;
