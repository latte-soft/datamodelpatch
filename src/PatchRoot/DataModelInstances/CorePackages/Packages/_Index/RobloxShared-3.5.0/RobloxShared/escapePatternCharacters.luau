return {
    escapePatternCharacters = function(v0)
        return string.gsub(v0, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1");
    end
};
