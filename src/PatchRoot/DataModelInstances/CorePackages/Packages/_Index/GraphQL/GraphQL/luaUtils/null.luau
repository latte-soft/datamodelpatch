return (setmetatable({
    __NULL_IDENTIFIER__ = "__GRAPHQL_NULL_OBJECT__"
}, {
    __newindex = function(_, v1, _)
        error(("%q (%s) is not a valid member of %s"):format(tostring(v1), typeof(v1), "null"), 2);
    end, 
    __metatable = false, 
    __tostring = function()
        return "null";
    end
}));
