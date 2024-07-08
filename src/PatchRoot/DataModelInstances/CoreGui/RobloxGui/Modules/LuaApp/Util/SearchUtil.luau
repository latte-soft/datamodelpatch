return {
    KeywordNormalize = function(v0)
        return (v0:gsub("\239\191\188", ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""));
    end
};
