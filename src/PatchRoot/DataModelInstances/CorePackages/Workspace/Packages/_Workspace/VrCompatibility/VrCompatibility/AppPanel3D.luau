local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local v6 = require(script.Parent.RoundedCornersFrame);
local v7 = require(script.Parent.useVRFloorOffset);
local l_ROUNDED_CORNER_RADIUS_0 = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS;
return function(v9)
    local v10 = nil;
    v10 = if not v9.roundedCornersFrameColor then v9[v2.Children] else {
        RoundedFrame = v2.createElement(v6, {
            cornerRadius = l_ROUNDED_CORNER_RADIUS_0 / (384 / (v9.virtualScreenSize.X / v9.partSize.X)), 
            backgroundColor = v9.roundedCornersFrameColor, 
            backgroundTransparency = 0
        }, v9[v2.Children])
    };
    local v11 = v7();
    return v1.createElement(l_Panel3D_0, v4.Dictionary.join(v9, {
        offset = CFrame.lookAt(Vector3.new(v9.offset.X, v9.offset.Y - v11.Y, v9.offset.Z), (Vector3.new(0, v9.offset.Y - v11.Y, 0)))
    }), v10);
end;
