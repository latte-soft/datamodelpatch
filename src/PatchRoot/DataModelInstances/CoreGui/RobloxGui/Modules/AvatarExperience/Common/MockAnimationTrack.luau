local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {};
    setmetatable(v1, v0);
    v1.StoppedBindableEvent = Instance.new("BindableEvent");
    v1.EndedBindableEvent = Instance.new("BindableEvent");
    v1.DidLoopBindableEvent = Instance.new("BindableEvent");
    v1.Stopped = v1.StoppedBindableEvent.Event;
    v1.Ended = v1.EndedBindableEvent.Event;
    v1.DidLoop = v1.DidLoopBindableEvent.Event;
    v1.IsPlaying = false;
    return v1;
end;
v0.Play = function(v2, _)
    v2.IsPlaying = true;
    task.spawn(function()
        task.wait(1);
        if v2.IsPlaying then
            v2.IsPlaying = false;
            v2.StoppedBindableEvent:Fire();
            task.wait(0.2);
            v2.EndedBindableEvent:Fire();
        end;
    end);
end;
v0.Stop = function(v4, _)
    if v4.IsPlaying then
        task.spawn(function()
            v4.IsPlaying = false;
            v4.StoppedBindableEvent:Fire();
            task.wait(0.2);
            v4.EndedBindableEvent:Fire();
        end);
    end;
end;
v0.Destroy = function(_)
end;
return v0;
