local v0 = require(script.Parent.Parent.Actions.OpenResultModal);
return function(v1)
    return function(v2)
        v2:dispatch(v0(v1));
    end;
end;
