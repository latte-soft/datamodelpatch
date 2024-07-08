local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Parent.LuauPolyfill);
local _ = require(l_Parent_0.language.ast);
local _ = require(l_Parent_0.execution.execute);
local _ = require(l_Parent_0.type.schema);
local _ = require(l_Parent_0.type.definition);
return {
    subscribe = function(_)
        error("graphql-lua does not currently implement subscriptions");
    end, 
    createSourceEventStream = function(_, _, _, _, _, _, _)
        error("graphql-lua does not currently implement subscriptions");
    end
};
