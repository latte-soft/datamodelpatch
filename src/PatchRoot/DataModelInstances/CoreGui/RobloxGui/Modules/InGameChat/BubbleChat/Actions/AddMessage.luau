local l_makeActionCreator_0 = require(game:GetService("CorePackages").Rodux).makeActionCreator;
local v1 = require(script.Parent.Parent.Helpers.maybeAssert);
local v2 = require(script.Parent.Parent.Types);
return l_makeActionCreator_0(script.Name, function(v3)
    v1(v2.IMessage(v3));
    return {
        message = v3
    };
end);
