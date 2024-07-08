local v0 = require(script.Parent.Enum.TransitionAnimation);
local v1 = {
    [v0.SlideInFromRight] = "slideInFromRight", 
    [v0.SlideInFromBottom] = "slideInFromBottom"
};
return function(v2)
    if not v2 then
        return nil;
    else
        return v1[v2];
    end;
end;
