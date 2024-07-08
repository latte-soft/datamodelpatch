return {
    default = function(v0, v1, v2)
        return ("%s %s%s"):format(tostring(v1), v0, v1 == 1 and "" or v2);
    end
};
