local v0 = {};
v0.__index = v0;
v0.new = function()
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v4 = {
        FullscreenChanged = {
            Connect = function(_, v3)
                return l_BindableEvent_0.Event:Connect(v3);
            end, 
            GoFullscreen = function()
                l_BindableEvent_0:Fire(true);
            end
        }, 
        ReducedMotion = false, 
        PreferredTransparency = 0.55, 
        UiNavigationKeyBindEnabled = true
    };
    setmetatable(v4, {
        __index = v0
    });
    return v4;
end;
v0.InFullScreen = function(_)
    return false;
end;
return v0;
