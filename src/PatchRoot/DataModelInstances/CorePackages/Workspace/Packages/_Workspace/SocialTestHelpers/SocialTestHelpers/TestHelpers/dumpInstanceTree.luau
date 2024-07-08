local v0 = require(script.Parent.IndentedLineBuffer);
local function v1(v2, v3)
    if v2 == nil then
        v3:addLine("[nil Instance]");
        return ;
    elseif v2.Name == nil then
        v3:addLine("[Invalid Instance]");
        return ;
    else
        v3:addLine(v2.Name);
        v3:indent();
        for _, v5 in ipairs(v2:GetChildren()) do
            v1(v5, v3);
        end;
        v3:unindent();
        return ;
    end;
end;
return function(v6)
    local v7 = v0.new();
    v1(v6, v7);
    return (tostring(v7));
end;
