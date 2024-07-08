local _ = require(script.Parent.Parent.util.Types);
local function v6(v1)
    for _, v3 in v1, nil, nil do
        for _, v5 in v3, nil, nil do
            if not (not v5.created or not v5.instance) then
                v5.instance:Destroy();
            end;
        end;
    end;
    v1 = {};
end;
return function(v7, v8)
    v6(v7);
    v6(v8);
end;
