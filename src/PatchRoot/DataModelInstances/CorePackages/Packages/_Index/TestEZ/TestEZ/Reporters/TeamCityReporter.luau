local l_TestService_0 = game:GetService("TestService");
local v1 = require(script.Parent.Parent.TestEnum);
local v2 = {};
local function _(v3)
    return (string.gsub(string.gsub(string.gsub(v3, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n"));
end;
local function v6(v5)
    return string.format("##teamcity[testSuiteStarted name='%s']", (string.gsub(string.gsub(string.gsub(v5, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n")));
end;
local function v8(v7)
    return string.format("##teamcity[testSuiteFinished name='%s']", (string.gsub(string.gsub(string.gsub(v7, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n")));
end;
local function v10(v9)
    return string.format("##teamcity[testStarted name='%s']", (string.gsub(string.gsub(string.gsub(v9, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n")));
end;
local function v12(v11)
    return string.format("##teamcity[testFinished name='%s']", (string.gsub(string.gsub(string.gsub(v11, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n")));
end;
local function v15(v13, v14)
    return string.format("##teamcity[testFailed name='%s' message='%s']", string.gsub(string.gsub(string.gsub(v13, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n"), (string.gsub(string.gsub(string.gsub(v14, "([]|'[])", "|%1"), "\r", "|r"), "\n", "|n")));
end;
local function v16(v17, v18, v19)
    v18 = v18 or {};
    v19 = v19 or 0;
    if v17.status == v1.TestStatus.Skipped then
        return v18;
    elseif v17.planNode.type == v1.NodeType.Describe then
        table.insert(v18, v6(v17.planNode.phrase));
        for _, v21 in ipairs(v17.children) do
            v16(v21, v18, v19 + 1);
        end;
        table.insert(v18, v8(v17.planNode.phrase));
        return v18;
    else
        table.insert(v18, v10(v17.planNode.phrase));
        if v17.status == v1.TestStatus.Failure then
            table.insert(v18, v15(v17.planNode.phrase, table.concat(v17.errors, "\n")));
        end;
        table.insert(v18, v12(v17.planNode.phrase));
        return v18;
    end;
end;
local function v26(v22)
    local v23 = {};
    for _, v25 in ipairs(v22.children) do
        v16(v25, v23, 0);
    end;
    return v23;
end;
local function _(v27)
    return table.concat(v26(v27), "\n");
end;
v2.report = function(v29)
    print(table.concat({
        "Test results:", 
        table.concat(v26(v29), "\n"), 
        ("%d passed, %d failed, %d skipped"):format(v29.successCount, v29.failureCount, v29.skippedCount)
    }, "\n"));
    if v29.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v29.failureCount));
    end;
    if #v29.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v31 in ipairs(v29.errors) do
            print("\226\128\162 " .. v31.phrase);
            print("");
            l_TestService_0:Error(v31.message);
            print("");
        end;
    end;
end;
return v2;
