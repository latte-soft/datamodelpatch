return function(v0)
    return {
        account = function(v1)
            return v0.fromString("auth:v1/" .. v1 .. "/account");
        end, 
        connect = function(v2)
            return v0.fromString("auth:v1/" .. v2 .. "/connect");
        end, 
        disconnect = function(v3)
            return v0.fromString("auth:v1/" .. v3 .. "/disconnect");
        end, 
        login = function(v4)
            return v0.fromString("auth:v1/" .. v4 .. "/login");
        end, 
        signup = function(v5)
            return v0.fromString("auth:v1/" .. v5 .. "/signup");
        end
    };
end;
