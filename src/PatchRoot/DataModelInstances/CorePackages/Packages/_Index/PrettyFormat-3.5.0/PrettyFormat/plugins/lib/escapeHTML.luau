return {
    default = function(v0)
        return v0:gsub("<", "&lt;"):gsub(">", "&gt;");
    end
};
