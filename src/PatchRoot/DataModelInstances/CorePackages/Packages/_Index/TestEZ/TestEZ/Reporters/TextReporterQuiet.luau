local l_TestService_0 = game:GetService("TestService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_status_0, l_result_0 = pcall(function()
    return require(l_Parent_0.JestMatcherUtils);
end);
local v4 = not not l_status_0 and l_result_0.EXPECTED_COLOR or function()
end;
local v5 = not not l_status_0 and l_result_0.RECEIVED_COLOR or function()
end;
local v6 = not not l_status_0 and l_result_0.BOLD_WEIGHT or function()
end;
local v7 = not not l_status_0 and l_result_0.DIM_COLOR or function()
end;
local v8 = require(script.Parent.Parent.TestEnum);
local v9 = (" "):rep(3);
local v10 = {
    [v8.TestStatus.Success] = v4("+"), 
    [v8.TestStatus.Failure] = v5("-"), 
    [v8.TestStatus.Skipped] = v7("~")
};
local v11 = {};
local function v12(v13, v14, v15)
    v14 = v14 or {};
    v15 = v15 or 0;
    if v13.status == v8.TestStatus.Skipped then
        return v14;
    else
        local v16 = nil;
        if v13.status ~= v8.TestStatus.Success then
            v16 = ("%s[%s] %s"):format(v9:rep(v15), v10[v13.status] or "?", v13.planNode.phrase);
        end;
        table.insert(v14, v16);
        for _, v18 in ipairs(v13.children) do
            v12(v18, v14, v15 + 1);
        end;
        return v14;
    end;
end;
local function v23(v19)
    local v20 = {};
    for _, v22 in ipairs(v19.children) do
        v12(v22, v20, 0);
    end;
    return v20;
end;
local function _(v24)
    return table.concat(v23(v24), "\n");
end;
v11.report = function(v26)
    print(table.concat({
        "Test results:", 
        table.concat(v23(v26), "\n"), 
        ("%d passed, %d failed, %d skipped"):format(v26.successCount, v26.failureCount, v26.skippedCount)
    }, "\n"));
    if v26.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v26.failureCount));
    end;
    if #v26.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v28 in ipairs(v26.errors) do
            print(v6(v5("\226\128\162 " .. v28.phrase)));
            print("");
            l_TestService_0:Error(v28.message);
            print("");
        end;
    end;
end;
return v11;
