local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.CarouselIndexSelected);
local v2 = require(l_Parent_0.Constants);
return function(v3)
    return function(v4)
        v4:dispatch(v1((math.clamp(v4:getState().Screenshots.Carousel.SelectedCaptureIndex + (v3 == v2.CarouselDirection.Left and -1 or 1), 1, #v4:getState().Screenshots.Captures))));
    end;
end;
