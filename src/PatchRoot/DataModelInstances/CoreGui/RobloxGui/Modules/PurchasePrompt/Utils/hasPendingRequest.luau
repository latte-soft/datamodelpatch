local v0 = require(script.Parent.Parent.Enums.RequestType);
return function(v1)
    return v1.promptRequest.requestType ~= v0.None;
end;
