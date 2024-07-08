local l_Workspace_0 = game:GetService("Workspace");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ObservableValue_0 = require(script.Parent.ChromeUtils).ObservableValue;
local v3 = l_ObservableValue_0.new(Vector2.new(0, 0));
local v4 = l_ObservableValue_0.new(false);
local v5 = nil;
createViewportInfo = function(v6)
    local v7 = v6.X < v6.Y;
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v9 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v9 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    return {
        size = v6, 
        portraitOrientation = v7, 
        tinyPortrait = (v9 and v7) and v6.X < 360, 
        isMobileDevice = v9
    };
end;
local v10 = l_ObservableValue_0.new(createViewportInfo(Vector2.zero));
updateViewportSize = function(v11)
    local v12 = Vector2.new(v11.X, v11.Y);
    v3:set(v12);
    v10:set(createViewportInfo(v12));
end;
setCurrentCamera = function(v13)
    if v5 then
        pcall(function()
            v5:Disconnect();
        end);
        v5 = nil;
    end;
    if v13 then
        local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
        local l_v4_0 = v4;
        local v16 = true;
        if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.IOS then
            v16 = l_l_UserInputService_0_Platform_1 == Enum.Platform.Android;
        end;
        l_v4_0:set(v16);
        v5 = v13:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            updateViewportSize(v13.ViewportSize);
        end);
        updateViewportSize(v13.ViewportSize);
    end;
end;
l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    setCurrentCamera(l_Workspace_0.CurrentCamera);
end);
setCurrentCamera(l_Workspace_0.CurrentCamera);
return {
    screenSize = v3, 
    mobileDevice = v4, 
    viewport = v10, 
    isSmallTouchScreen = function()
        local v17 = v3:get();
        local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
        if l_TouchEnabled_0 then
            l_TouchEnabled_0 = true;
            if v17.Y >= 500 then
                l_TouchEnabled_0 = v17.X < 700;
            end;
        end;
        return l_TouchEnabled_0;
    end
};
