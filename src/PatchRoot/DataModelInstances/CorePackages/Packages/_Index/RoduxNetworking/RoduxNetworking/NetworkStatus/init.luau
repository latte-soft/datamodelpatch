return function(v0)
    return {
        getStatus = require(script.getStatus)(v0), 
        setStatus = require(script.setStatus)(v0), 
        installReducer = require(script.installReducer)(v0), 
        Enum = {
            Status = require(script.EnumNetworkStatus)
        }
    };
end;
