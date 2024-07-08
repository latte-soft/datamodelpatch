local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local l_getSafeAreaSize_0 = require(l_Parent_0.InputUi).getSafeAreaSize;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v5 = v1.PureComponent:extend("FullscreenPageWithSafeArea");
v5.render = function(v6)
    local l_statusBarHeight_0 = v6.props.statusBarHeight;
    local l_screenSize_0 = v6.props.screenSize;
    local l_globalGuiInset_0 = v6.props.globalGuiInset;
    local l_BackgroundColor3_0 = v6.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v6.props.BackgroundTransparency;
    local l_includeStatusBar_0 = v6.props.includeStatusBar;
    local l_renderFullscreenBackground_0 = v6.props.renderFullscreenBackground;
    local v14 = v6.props[v1.Children];
    if not (l_screenSize_0.X ~= 0) or l_screenSize_0.Y == 0 then
        return nil;
    else
        local v15 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
        local l_top_0 = l_globalGuiInset_0.top;
        local v17 = if v6.props.useFullScalePage ~= nil then v6.props.useFullScalePage else l_IsVRAppBuild_0();
        if l_includeStatusBar_0 then
            v15 = UDim2.new(0, v15.X.Offset, 0, v15.Y.Offset - l_statusBarHeight_0);
            l_top_0 = l_top_0 + l_statusBarHeight_0;
        end;
        return v1.createElement("Frame", {
            Position = if not v17 then UDim2.new(0, -l_globalGuiInset_0.left, 0, -l_globalGuiInset_0.top) else UDim2.new(0, 0, 0, 0), 
            Size = if not v17 then UDim2.new(0, l_screenSize_0.X, 0, l_screenSize_0.Y) else UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_BackgroundColor3_0, 
            BackgroundTransparency = l_BackgroundTransparency_0, 
            Active = true, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            Background = l_renderFullscreenBackground_0 and l_renderFullscreenBackground_0(l_top_0), 
            SafeAreaFrame = v1.createElement("Frame", {
                Position = if not v17 then UDim2.new(0, l_globalGuiInset_0.left, 0, l_top_0) else UDim2.new(0, 0, 0, 0), 
                Size = if not v17 then v15 else UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = not l_renderFullscreenBackground_0 and 1 or 2
            }, v14)
        });
    end;
end;
return v2.connect(function(v18, _)
    return {
        statusBarHeight = v18.TopBar.statusBarHeight, 
        screenSize = v18.ScreenSize, 
        globalGuiInset = v18.GlobalGuiInset
    };
end)(v5);
