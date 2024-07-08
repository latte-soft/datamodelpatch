return {
    Signal = function()
        local v0 = {};
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v2 = nil;
        local v3 = nil;
        v0.fire = function(_, ...)
            v2 = {
                ...
            };
            v3 = select("#", ...);
            l_BindableEvent_0:Fire();
        end;
        v0.connect = function(_, v6)
            if not v6 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_0.Event:connect(function()
                v6(unpack(v2, 1, v3));
            end);
        end;
        v0.wait = function(_)
            l_BindableEvent_0.Event:wait();
            assert(v2, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
            return unpack(v2, 1, v3);
        end;
        return v0;
    end
};
