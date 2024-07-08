local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = require(l_Modules_0.LuaApp.ArgCheck);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local v8 = v3.PureComponent:extend("TextureScroller");
v8.init = function(v9)
    v9.lerpValue = 0;
    v9.imageRef = v3.createRef();
    v9.renderSteppedCallback = function(v10)
        local l_imageScrollCycleTime_0 = v9.props.imageScrollCycleTime;
        local l_imagePositionStart_0 = v9.props.imagePositionStart;
        local l_imagePositionEnd_0 = v9.props.imagePositionEnd;
        local v14 = 0;
        if l_imageScrollCycleTime_0 ~= 0 then
            v14 = v10 / l_imageScrollCycleTime_0;
        end;
        v9.lerpValue = (v9.lerpValue + v14) % 1;
        if not (v7 and not v9.imageRef.current) then
            v9.imageRef.current.Position = l_imagePositionStart_0:lerp(l_imagePositionEnd_0, v9.lerpValue);
        end;
    end;
end;
v8.render = function(v15)
    v6.isType(v15.props.Image, "string", "self.props.Image");
    v6.isType(v15.props.imageScrollCycleTime, "number", "self.props.imageScrollCycleTime");
    v6.isType(v15.props.imagePositionStart, "UDim2", "self.props.imagePositionStart");
    v6.isType(v15.props.imagePositionEnd, "UDim2", "self.props.imagePositionEnd");
    return v3.createElement("Frame", {
        Size = v15.props.Size, 
        Position = v15.props.Position, 
        AnchorPoint = v15.props.AnchorPoint, 
        LayoutOrder = v15.props.LayoutOrder, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        v3.createElement(v5, {
            Size = v15.props.imageSize, 
            Position = v15.props.imagePositionStart, 
            AnchorPoint = v15.props.imageAnchorPoint, 
            BackgroundTransparency = 1, 
            Image = v15.props.Image, 
            ImageTransparency = v15.props.ImageTransparency, 
            [v3.Ref] = v15.imageRef
        }); 
        renderStepped = v3.createElement(v4, {
            event = l_RunService_0.renderStepped, 
            callback = v15.renderSteppedCallback
        })
    });
end;
return v8;
