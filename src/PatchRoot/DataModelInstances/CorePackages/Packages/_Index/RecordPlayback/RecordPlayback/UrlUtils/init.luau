local v0 = require(script.NetUrl);
return {
    parse = function(v1)
        local v2 = v0.normalize(v1);
        local v3 = {};
        for v4, v5 in pairs(v2.query) do
            v3[v4] = v5;
        end;
        return {
            host = v2.host, 
            path = v2.path, 
            query = v3, 
            scheme = v2.scheme, 
            port = v2.port, 
            user = v2.user, 
            password = v2.password, 
            fragment = v2.fragment
        };
    end, 
    formatQuery = function(v6)
        return v0.buildQuery(v6);
    end
};
