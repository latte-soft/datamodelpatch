local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_Parent_0 = script.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v3 = nil;
pcall(function()
    v3 = game:GetService("ThirdPartyUserService");
end);
local v4 = require(l_Parent_0.CameraManager);
local v5 = require(l_Parent_0.EventHub);
local v6 = require(l_Parent_0.SoundManager);
local v7 = require(l_Parent_0.Utility);
local v8 = {};
local v9 = v7.Create("ImageLabel")({
    Name = "BackgroundImage", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 0, 
    BackgroundColor3 = Color3.new(0.11372549019607843, 0.1843137254901961, 0.23921568627450981), 
    BorderSizePixel = 0, 
    Image = "rbxasset://textures/ui/Shell/Background/Home_screen_01.png", 
    Parent = l_RobloxGui_0
});
v5:addEventListener(v5.Notifications.AuthenticationSuccess, "authSuccessCameraControl", function(_)
    v4:DisableCameraControl();
end);
if v3 then
    v3.ActiveUserSignedOut:connect(function()
        v4:EnableCameraControl();
    end);
end;
local v11 = v6:Play("BackgroundLoop", 0.33, true);
if v11 then
    local v12 = nil;
    do
        local l_v12_0 = v12;
        l_v12_0 = v11.DidLoop:connect(function(_, v15)
            if v15 > 0 then
                l_v12_0 = v7.DisconnectEvent(l_v12_0);
                if v11 then
                    v6:TweenSound(v11, 0.1, 3);
                end;
            end;
        end);
    end;
end;
spawn(function()
    while l_ContentProvider_0.RequestQueueSize > 0 do
        wait(0.01);
    end;
    v4:EnableCameraControl();
    spawn(function()
        v4:CameraMoveToAsync();
    end);
    v7.PropertyTweener(v9, "BackgroundTransparency", 0, 1, 1.5, v7.EaseInOutQuad, true);
    v7.PropertyTweener(v9, "ImageTransparency", 0, 1, 1.5, v7.EaseInOutQuad, true, function()
        v9:Destroy();
    end);
end);
return v8;
