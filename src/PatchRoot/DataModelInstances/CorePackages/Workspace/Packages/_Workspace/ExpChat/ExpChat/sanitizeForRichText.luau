return function(v0)
    return (string.gsub(v0, "%p", {
        ["<"] = "&lt;", 
        [">"] = "&gt;", 
        ["&"] = "&amp;"
    }));
end;
