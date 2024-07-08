local v0 = require(script:FindFirstAncestor("http-request").Parent.Cryo);
return function(v1, v2, v3)
    return {
        Start = function(_, v5)
            local v6 = {};
            if type(v3.mockResponse) == "function" then
                v6 = v3.mockResponse();
            elseif v3.mockResponse then
                v6 = v3.mockResponse;
            end;
            v5(v3.success, (v0.Dictionary.join({
                Url = v1, 
                Method = v2
            }, v6)));
        end, 
        Cancel = function()
            if v3.cancel then
                v3.cancel();
            end;
        end
    };
end;
