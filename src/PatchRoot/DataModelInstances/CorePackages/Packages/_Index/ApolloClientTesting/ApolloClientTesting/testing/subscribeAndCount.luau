local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_1.ApolloClient);
local _ = require(l_Parent_0.utilities.observables.Observable);
local l_asyncMap_0 = require(l_Parent_0.utilities.observables.asyncMap).asyncMap;
v0.default = function(v8, v9, v10)
    local v11 = nil;
    local v12 = v3.delay(0);
    local v13 = 0;
    local v16 = l_asyncMap_0(v9, function(v14)
        v12 = v12:andThen(function()
            return v3.delay(0);
        end):andThen(function()
            v13 = v13 + 1;
            return v10(v13, v14);
        end):catch(v11);
        return v12;
    end):subscribe({
        error = function(_, ...)
            v11(...);
        end
    });
    v11 = function(v17)
        v16:unsubscribe();
        v8(v17);
    end;
    return v16;
end;
return v0;
