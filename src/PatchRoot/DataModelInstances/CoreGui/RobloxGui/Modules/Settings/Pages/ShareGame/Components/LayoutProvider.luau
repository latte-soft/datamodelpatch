local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppTempCommon_0 = l_CorePackages_0.AppTempCommon;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v7 = require(l_ShareGame_0.Constants);
local v8 = require(l_AppTempCommon_0.LuaApp.Actions.SetDeviceOrientation);
local v9 = require(l_ShareGame_0.Actions.SetIsSmallTouchScreen);
local v10 = require(l_ShareGame_0.Actions.SetDeviceLayout);
local v11 = v4.Component:extend("LayoutProvider");
v11.didMount = function(v12)
    if workspace.CurrentCamera then
        v12:setObservedCamera(workspace.CurrentCamera);
    end;
    v12.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        if workspace.CurrentCamera then
            v12:setObservedCamera(workspace.CurrentCamera);
        end;
    end);
end;
v11.willUnmount = function(v13)
    if v13.cameraChangedListener then
        v13.cameraChangedListener:Disconnect();
    end;
    if v13.viewportSizeListener then
        v13.viewportSizeListener:Disconnect();
    end;
end;
v11.setObservedCamera = function(v14, v15)
    if v14.viewportSizeListener then
        v14.viewportSizeListener:Disconnect();
    end;
    v14:checkAllDeviceInfo(v15.ViewportSize);
    v14.viewportSizeListener = v15:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        local l_ViewportSize_0 = v15.ViewportSize;
        if not (l_ViewportSize_0.X > 1) or l_ViewportSize_0.Y <= 1 then
            return ;
        else
            v14:checkAllDeviceInfo(l_ViewportSize_0);
            return ;
        end;
    end);
end;
v11.checkDeviceOrientation = function(v17, v18)
    local v19 = v18.Y < v18.X and v7.DeviceOrientation.LANDSCAPE or v7.DeviceOrientation.PORTRAIT;
    if v17._deviceOrientation ~= v19 then
        v17._deviceOrientation = v19;
        v17.props.setDeviceOrientation(v19);
    end;
end;
v11.checkDeviceIsSmallTouchScreen = function(v20, v21)
    local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
    if l_TouchEnabled_0 then
        l_TouchEnabled_0 = true;
        if v21.X >= 700 then
            l_TouchEnabled_0 = v21.Y < 500;
        end;
    end;
    if v20._isSmallTouchScreen ~= l_TouchEnabled_0 then
        v20._isSmallTouchScreen = l_TouchEnabled_0;
        v20.props.setIsSmallTouchScreen(v20._isSmallTouchScreen);
    end;
end;
v11.checkDeviceLayout = function(v23)
    local v24 = nil;
    v24 = if not v23._isSmallTouchScreen then if l_UserInputService_0.TouchEnabled then if v23._deviceOrientation == v7.DeviceOrientation.LANDSCAPE then v7.DeviceLayout.TABLET_LANDSCAPE else v7.DeviceLayout.TABLET_PORTRAIT else v7.DeviceLayout.DESKTOP else if v23._deviceOrientation == v7.DeviceOrientation.LANDSCAPE then v7.DeviceLayout.PHONE_LANDSCAPE else v7.DeviceLayout.PHONE_PORTRAIT;
    if v23._deviceLayout ~= v24 then
        v23._deviceLayout = v24;
        v23.props.setDeviceLayout(v23._deviceLayout);
    end;
end;
v11.checkAllDeviceInfo = function(v25, v26)
    v25:checkDeviceOrientation(v26);
    v25:checkDeviceIsSmallTouchScreen(v26);
    v25:checkDeviceLayout();
end;
v11.render = function(v27)
    return v4.oneChild(v27.props[v4.Children]);
end;
return v5.UNSTABLE_connect2(nil, function(v28)
    return {
        setDeviceOrientation = function(v29)
            return v28(v8(v29));
        end, 
        setIsSmallTouchScreen = function(v30)
            return v28(v9(v30));
        end, 
        setDeviceLayout = function(v31)
            return v28(v10(v31));
        end
    };
end)(v11);
