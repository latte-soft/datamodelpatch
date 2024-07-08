local v0 = require(script.Parent.TestEnum);
local v1 = {
    [v0.TestStatus.Success] = "+", 
    [v0.TestStatus.Failure] = "-", 
    [v0.TestStatus.Skipped] = "~"
};
local v2 = {};
v2.__index = v2;
v2.new = function(v3)
    local v4 = {
        successCount = 0, 
        failureCount = 0, 
        skippedCount = 0, 
        planNode = v3, 
        children = {}, 
        errors = {}
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.createNode = function(v5)
    return {
        planNode = v5, 
        children = {}, 
        errors = {}, 
        status = nil
    };
end;
v2.visitAllNodes = function(v6, v7, v8)
    for _, v10 in ipairs((v8 or v6).children) do
        v7(v10);
        v6:visitAllNodes(v7, v10);
    end;
end;
v2.visualize = function(v11, v12, v13)
    v12 = v12 or v11;
    v13 = v13 or 0;
    local v14 = {};
    for _, v16 in ipairs(v12.children) do
        if v16.planNode.type == v0.NodeType.It then
            local v17 = ("%s[%s] %s"):format((" "):rep(3 * v13), v1[v16.status] or "?", v16.planNode.phrase);
            if v16.messages and #v16.messages > 0 then
                v17 = v17 .. "\n " .. (" "):rep(3 * v13) .. table.concat(v16.messages, "\n " .. (" "):rep(3 * v13));
            end;
            table.insert(v14, v17);
        else
            local v18 = ("%s%s"):format((" "):rep(3 * v13), v16.planNode.phrase or "");
            if v16.status then
                v18 = v18 .. (" (%s)"):format(v16.status);
            end;
            table.insert(v14, v18);
            if #v16.children > 0 then
                table.insert(v14, (v11:visualize(v16, v13 + 1)));
            end;
        end;
    end;
    return table.concat(v14, "\n");
end;
return v2;
