local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {};
    setmetatable(v1, v0);
    v1.StoppedBindableEvent = Instance.new("BindableEvent");
    v1.Stopped = v1.StoppedBindableEvent.Event;
    v1.WeightCurrent = 1;
    v1.IsPlaying = false;
    return v1;
end;
v0.Play = function(v2, _)
    v2.IsPlaying = true;
end;
v0.Stop = function(v4, _)
    if v4.IsPlaying then
        v4.IsPlaying = false;
        v4.StoppedBindableEvent:Fire();
    end;
end;
v0.AdjustWeight = function(v6, v7)
    v6.WeightCurrent = v7;
end;
v0.Destroy = function(_)
end;
return v0;
