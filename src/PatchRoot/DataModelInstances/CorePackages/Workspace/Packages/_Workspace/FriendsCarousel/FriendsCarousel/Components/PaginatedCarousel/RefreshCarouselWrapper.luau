local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local l_useThrottledCallback_0 = require(l_Parent_0.RoactUtils).Hooks.useThrottledCallback;
local v3 = game:DefineFastInt("FriendsCarouselRefreshThrottleInterval", 3);
return function(v4)
    local v5, v6 = v1.useState(0);
    local v8 = l_useThrottledCallback_0(function()
        v4.refetchData();
        v6(function(v7)
            return v7 + 1;
        end);
    end, v3);
    v1.useEffect(function()
        if v4.refreshSignal then
            v4.refreshSignal:connect(v8);
            return ;
        else
            return ;
        end;
    end, {
        v4.refreshSignal
    });
    return v1.createElement("Frame", {
        key = v5, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        component = v4.renderChildComponent()
    });
end;
