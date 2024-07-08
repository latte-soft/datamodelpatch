local v0 = require(script.Parent.utils.mergeLists);
return {
    fields = {
        profileInsights = {
            merge = function(_, v2, v3)
                return v0(v2, v3);
            end
        }
    }
};
