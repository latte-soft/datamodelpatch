local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v10 = v2.PureComponent:extend("NavOverlayContainer");
v10.validateProps = v4.strictInterface({
    onAbsoluteSizeChanged = v4.optional(v4.callback), 
    onAbsolutePositionChanged = v4.optional(v4.callback), 
    ZIndex = v4.optional(v4.integer), 
    [v2.Children] = v4.table, 
    globalGuiInset = v4.strictInterface({
        left = v4.integer, 
        top = v4.integer, 
        right = v4.integer, 
        bottom = v4.integer
    }), 
    screenSize = v4.Vector2, 
    isPortrait = v4.boolean
});
v10.render = function(v11)
    local l_globalGuiInset_0 = v11.props.globalGuiInset;
    local v13 = l_getSafeAreaSize_0(v11.props.screenSize, l_globalGuiInset_0);
    local v14 = UDim2.fromScale(1, 1);
    local v15 = UDim2.fromOffset(0, 0);
    if not v11.props.isPortrait then
        v14 = UDim2.fromScale(v6.LandscapeNavWidth, 1);
        v15 = UDim2.fromOffset(0, 0);
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = if not l_IsVRAppBuild_0() then UDim2.new(0, l_globalGuiInset_0.left, 0, l_globalGuiInset_0.top) else UDim2.fromScale(0, 0), 
        Size = if not l_IsVRAppBuild_0() then v13 else UDim2.fromScale(1, 1), 
        ZIndex = v11.props.ZIndex
    }, {
        WidthFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v14, 
            Position = v15, 
            [v2.Change.AbsoluteSize] = v11.props.onAbsoluteSizeChanged, 
            [v2.Change.AbsolutePosition] = v11.props.onAbsolutePositionChanged
        }, v11.props[v2.Children])
    });
end;
return v3.connect(function(v16, _)
    return {
        globalGuiInset = v16.GlobalGuiInset, 
        screenSize = v16.ScreenSize, 
        isPortrait = v8(v16)
    };
end, nil)(v10);
