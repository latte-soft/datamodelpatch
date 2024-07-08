local v0 = require(script.Parent.Parent.Parent.Thunks.FetchProfilePageData);
return function(v1)
    return {
        fetchProfilePageData = function(v2)
            v1(v0(v2));
        end
    };
end;
