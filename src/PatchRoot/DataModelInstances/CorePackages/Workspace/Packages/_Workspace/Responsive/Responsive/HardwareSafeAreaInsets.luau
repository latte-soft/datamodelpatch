local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v4 = {
    [Enum.Platform.XBoxOne] = true, 
    [Enum.Platform.XBox360] = true, 
    [Enum.Platform.WiiU] = true, 
    [Enum.Platform.PS3] = true, 
    [Enum.Platform.PS4] = true, 
    [Enum.Platform.PS5] = true, 
    [Enum.Platform.Ouya] = true, 
    [Enum.Platform.AndroidTV] = true
};
local v5 = false;
local v6 = l_Signal_0.new();
local v7 = nil;
local v8 = nil;
local v9 = {
    left = 0, 
    top = 0, 
    right = 0, 
    bottom = 0
};
diffInsets = function(v10, v11)
    local v12 = true;
    if v10.top == v11.top then
        v12 = true;
        if v10.bottom == v11.bottom then
            v12 = true;
            if v10.left == v11.left then
                v12 = v10.right ~= v11.right;
            end;
        end;
    end;
    return v12;
end;
local v13 = nil;
handleSizeChange = function()
    local v14 = getHardwareSafeAreaInsets();
    if diffInsets(v14, v9) then
        v9 = v14;
        if v13 then
            task.cancel(v13);
        end;
        v13 = task.defer(function()
            v13 = nil;
            v6:fire(v14);
        end);
    end;
end;
init = function()
    if not v5 then
        if not v7 then
            v7 = Instance.new("ScreenGui");
            v7.Name = "_FullscreenTestGui";
            v7.Parent = l_CoreGui_0;
            v7.ScreenInsets = Enum.ScreenInsets.None;
            v7:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange);
            v7:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange);
        end;
        if not v8 then
            v8 = Instance.new("ScreenGui");
            v8.Name = "_DeviceTestGui";
            v8.Parent = l_CoreGui_0;
            v8.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
            v8:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange);
            v8:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange);
        end;
        handleSizeChange();
        v5 = true;
        return ;
    else
        return ;
    end;
end;
getHardwareSafeAreaInsets = function()
    local l_AbsolutePosition_0 = v7.AbsolutePosition;
    local l_AbsoluteSize_0 = v7.AbsoluteSize;
    local l_AbsolutePosition_1 = v8.AbsolutePosition;
    local v18 = l_AbsolutePosition_1 - l_AbsolutePosition_0;
    local v19 = (l_AbsolutePosition_0 + v7.AbsoluteSize) - (l_AbsolutePosition_1 + v8.AbsoluteSize);
    if v4[l_UserInputService_0:GetPlatform()] then
        local v20 = l_AbsoluteSize_0 * 0.05;
        v18 = v18 + v20;
        v19 = v19 + v20;
    end;
    return {
        left = math.round(v18.X), 
        top = math.round(v18.Y), 
        right = math.round(v19.X), 
        bottom = math.round(v19.Y)
    };
end;
return {
    connect = function(_, v22)
        init();
        return v6:connect(v22);
    end, 
    deviceInsets = function()
        init();
        return v9;
    end, 
    diffInsets = diffInsets, 
    hasExtraPlatformInset = function()
        return v4[l_UserInputService_0:GetPlatform()];
    end
};
