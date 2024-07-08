local l_XPath_0 = require(game:GetService("CorePackages").Rhodium).XPath;
return function(v1)
    return v1:cat(l_XPath_0.new("*"));
end;
