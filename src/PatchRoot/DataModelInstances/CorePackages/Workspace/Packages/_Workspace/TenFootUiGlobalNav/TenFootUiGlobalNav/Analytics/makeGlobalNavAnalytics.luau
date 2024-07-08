return function(v0, v1)
    local l_EventStream_0 = v0.EventStream;
    return {
        ButtonActivated = function(v3, v4)
            v1(l_EventStream_0, "TenFootUiGlobalNav", v3, v4);
        end
    };
end;
