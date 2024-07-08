local v0 = {};
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
v0.fromError = function(v2)
    return l_Observable_0.new(function(v3)
        v3:error(v2);
    end);
end;
return v0;
