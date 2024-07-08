local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(script.Parent.maybeAssert);
return function(v3)
    v2(v0.string(v3));
    if utf8.len(v3) == nil then
        return false;
    else
        local v4 = utf8.len(utf8.nfcnormalize(v3));
        if v1.MAX_MESSAGE_LENGTH < v4 then
            return false, v4;
        else
            return true;
        end;
    end;
end;
