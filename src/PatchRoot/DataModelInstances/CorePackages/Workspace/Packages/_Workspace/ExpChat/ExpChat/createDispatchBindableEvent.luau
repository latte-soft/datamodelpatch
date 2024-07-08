local v0 = require(script.Parent.DispatchBindableEvent);
return function(v1)
    v0.Event:Connect(function(v2)
        v1:dispatch(v2);
    end);
    v0:SetAttribute("isConnected", true);
    return v0;
end;
