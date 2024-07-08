local _ = require(script.Parent.Parent.Common.ContextPropsTypes);
return function(v1)
    return v1.profileUserId == v1.localUserId;
end;
