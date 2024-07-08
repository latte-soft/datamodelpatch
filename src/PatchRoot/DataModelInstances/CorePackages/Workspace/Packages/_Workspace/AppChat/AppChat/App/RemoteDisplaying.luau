local l_BindableEvent_0 = Instance.new("BindableEvent");
return {
    BindableEvent = l_BindableEvent_0, 
    setDisplaying = function(v1)
        l_BindableEvent_0:Fire(v1);
    end
};
