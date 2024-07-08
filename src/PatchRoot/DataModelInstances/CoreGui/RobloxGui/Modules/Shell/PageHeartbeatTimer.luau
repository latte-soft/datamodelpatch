local v0 = require(script.Parent.Analytics);
local v1 = {
    2, 
    10
};
local v2 = {};
local v3 = {};
local function _(v4, v5, v6)
    local v7 = false;
    task.delay(v4, function()
        if not v7 then
            v6(v5);
        end;
    end);
    return function()
        v7 = true;
    end;
end;
local function v11()
    for _, v10 in ipairs(v2) do
        if v10 ~= nil then
            v10();
        end;
    end;
    v2 = {};
end;
v3.onPageChanged = function(v12)
    v11();
    for v13, v14 in ipairs(v1) do
        local l_v2_0 = v2;
        local function v17(v16)
            v0.reportPageHeartbeat(v16, v12);
        end;
        local v18 = false;
        local v19;
        do
            local l_v18_0 = v18;
            task.delay(v14, function()
                if not l_v18_0 then
                    v17(v13);
                end;
            end);
            v19 = function()
                l_v18_0 = true;
            end;
        end;
        l_v2_0[v13] = v19;
    end;
end;
return v3;
