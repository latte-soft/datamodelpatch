return {
    createSignalIfSupported = function()
        local l_AbortController_0 = _G.AbortController;
        if typeof(l_AbortController_0) == "nil" then
            return {
                controller = false, 
                signal = false
            };
        else
            local v1 = l_AbortController_0.new();
            return {
                controller = v1, 
                signal = v1.signal
            };
        end;
    end
};
