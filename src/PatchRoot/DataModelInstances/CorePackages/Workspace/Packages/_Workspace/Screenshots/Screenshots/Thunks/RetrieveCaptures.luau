local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.CapturesRetrieved);
local _ = require(l_Parent_0.Types);
local function _(v4)
    local l_SelectedCaptureIndex_0 = v4.Screenshots.Carousel.SelectedCaptureIndex;
    if l_SelectedCaptureIndex_0 ~= nil then
        return v4.Screenshots.Captures[l_SelectedCaptureIndex_0];
    else
        return nil;
    end;
end;
return function()
    return function(v7)
        local v8 = v7:getState();
        local l_SelectedCaptureIndex_1 = v8.Screenshots.Carousel.SelectedCaptureIndex;
        v7:dispatch(v2(l_CaptureService_0:RetrieveCaptures(), if l_SelectedCaptureIndex_1 ~= nil then v8.Screenshots.Captures[l_SelectedCaptureIndex_1] else nil));
    end;
end;
