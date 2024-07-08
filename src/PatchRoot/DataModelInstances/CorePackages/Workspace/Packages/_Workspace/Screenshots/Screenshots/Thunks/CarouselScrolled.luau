local v0 = require(script.Parent.Parent.Actions.CarouselIndexSelected);
return function(v1)
    return function(v2)
        v2:dispatch(v0((math.clamp(v1, 1, #v2:getState().Screenshots.Captures))));
    end;
end;
