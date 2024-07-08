local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.SharedFlags);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_useIsFPSAtTarget_0 = require(l_Parent_0.SplashScreenManager).useIsFPSAtTarget;
local v8 = require(script.Parent.AppPanel3D);
local v9 = require(script.Parent.RoundedCornersFrame);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_GetFFlagEnableVRWrapperTransparency_0 = v4.GetFFlagEnableVRWrapperTransparency;
local l_GetFFlagAdjustVRFloor_0 = v4.GetFFlagAdjustVRFloor;
local l_ROUNDED_CORNER_RADIUS_0 = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS;
local _ = nil;
return (l_RoactAppPolicy_0.connect(function(v15)
    return {
        use3DPanels = v15.getUse3DPanels()
    };
end)(not l_GetFFlagAdjustVRFloor_0() and function(v16)
    local v17 = l_Object_0.assign({}, v16.vrProps, {
        hidden = v16.vrProps.hidden or not l_useIsFPSAtTarget_0()
    });
    if not v16.use3DPanels then
        return v1.createElement(v16.component, v16.props, v16[v2.Children]);
    else
        local _ = nil;
        return v1.createElement(l_Panel3D_0, v17, if not v17.roundedCornersFrameColor then v16[v2.Children] else {
            RoundedFrame = v2.createElement(v9, {
                cornerRadius = l_ROUNDED_CORNER_RADIUS_0 / (384 / (v17.virtualScreenSize.X / v17.partSize.X)), 
                backgroundColor = v17.roundedCornersFrameColor, 
                backgroundTransparency = not l_GetFFlagEnableVRWrapperTransparency_0() and 0 or (v17.backgroundTransparency or 0)
            }, v16[v2.Children])
        });
    end;
end or function(v19)
    local v20 = l_Object_0.assign({}, v19.vrProps, {
        hidden = v19.vrProps.hidden or not l_useIsFPSAtTarget_0()
    });
    if not v19.use3DPanels then
        return v1.createElement(v19.component, v19.props, v19[v2.Children]);
    else
        return v1.createElement(v8, v20, v19[v2.Children]);
    end;
end));
