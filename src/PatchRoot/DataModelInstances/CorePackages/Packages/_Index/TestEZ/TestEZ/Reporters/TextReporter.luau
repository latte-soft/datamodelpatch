local l_TestService_0 = game:GetService("TestService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_status_0, l_result_0 = pcall(function()
    return require(l_Parent_0.JestMatcherUtils);
end);
local v5 = not not l_status_0 and l_result_0.EXPECTED_COLOR or function(v4)
    return v4;
end;
local v7 = not not l_status_0 and l_result_0.RECEIVED_COLOR or function(v6)
    return v6;
end;
local v9 = not not l_status_0 and l_result_0.BOLD_WEIGHT or function(v8)
    return v8;
end;
local v11 = not not l_status_0 and l_result_0.DIM_COLOR or function(v10)
    return v10;
end;
local v12 = require(script.Parent.Parent.TestEnum);
local v13 = (" "):rep(3);
local v14 = {
    [v12.TestStatus.Success] = v5("+"), 
    [v12.TestStatus.Failure] = v7("-"), 
    [v12.TestStatus.Skipped] = v11("~")
};
local v15 = {};
local function v18(v16, v17)
    return v16.planNode.phrase:lower() < v17.planNode.phrase:lower();
end;
local function v19(v20, v21, v22)
    v21 = v21 or {};
    v22 = v22 or 0;
    if v20.status == v12.TestStatus.Skipped then
        return v21;
    else
        local _ = nil;
        table.insert(v21, if not v20.status then ("%s%s"):format(v13:rep(v22), v20.planNode.phrase) else ("%s[%s] %s"):format(v13:rep(v22), v14[v20.status] or "?", v20.planNode.phrase));
        table.sort(v20.children, v18);
        for _, v25 in ipairs(v20.children) do
            v19(v25, v21, v22 + 1);
        end;
        return v21;
    end;
end;
local function v30(v26)
    local v27 = {};
    table.sort(v26.children, v18);
    for _, v29 in ipairs(v26.children) do
        v19(v29, v27, 0);
    end;
    return v27;
end;
local function _(v31)
    return table.concat(v30(v31), "\n");
end;
v15.report = function(v33)
    print(table.concat({
        "Test results:", 
        table.concat(v30(v33), "\n"), 
        ("%d passed, %d failed, %d skipped"):format(v33.successCount, v33.failureCount, v33.skippedCount)
    }, "\n"));
    if v33.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v33.failureCount));
    end;
    if #v33.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v35 in ipairs(v33.errors) do
            print(v9(v7("\226\128\162 " .. v35.phrase)));
            print("");
            l_TestService_0:Error(v35.message);
            print("");
        end;
    end;
end;
return v15;
