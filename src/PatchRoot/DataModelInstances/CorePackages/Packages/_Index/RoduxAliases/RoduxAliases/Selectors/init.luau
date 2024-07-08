local _ = require(script.Parent.RoduxAliasesTypes);
return function(v1)
    return {
        getAliasByUserId = require(script.getAliasByUserId)(v1)
    };
end;
