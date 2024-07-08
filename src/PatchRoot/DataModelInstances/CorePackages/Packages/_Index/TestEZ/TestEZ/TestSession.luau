local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestResults);
local v2 = require(script.Parent.Context);
local v3 = require(script.Parent.ExpectationContext);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    local v6 = {
        results = v1.new(v5), 
        nodeStack = {}, 
        contextStack = {}, 
        expectationContextStack = {}, 
        hasFocusNodes = false
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.calculateTotals = function(v7)
    local l_results_0 = v7.results;
    l_results_0.successCount = 0;
    l_results_0.failureCount = 0;
    l_results_0.skippedCount = 0;
    l_results_0:visitAllNodes(function(v9)
        local l_status_0 = v9.status;
        if v9.planNode.type == v0.NodeType.It then
            if l_status_0 == v0.TestStatus.Success then
                l_results_0.successCount = l_results_0.successCount + 1;
                return ;
            elseif l_status_0 == v0.TestStatus.Failure then
                l_results_0.failureCount = l_results_0.failureCount + 1;
                return ;
            elseif l_status_0 == v0.TestStatus.Skipped then
                l_results_0.skippedCount = l_results_0.skippedCount + 1;
            end;
        end;
    end);
end;
v4.gatherErrors = function(v11)
    local l_results_1 = v11.results;
    l_results_1.errors = {};
    l_results_1:visitAllNodes(function(v13)
        if #v13.errors > 0 then
            for _, v15 in ipairs(v13.errors) do
                table.insert(l_results_1.errors, {
                    message = v15, 
                    phrase = v13.planNode.phrase
                });
            end;
        end;
    end);
end;
v4.finalize = function(v16)
    if #v16.nodeStack ~= 0 then
        error("Cannot finalize TestResults with nodes still on the stack", 2);
    end;
    v16:calculateTotals();
    v16:gatherErrors();
    return v16.results;
end;
v4.pushNode = function(v17, v18)
    local v19 = v1.createNode(v18);
    table.insert((v17.nodeStack[#v17.nodeStack] or v17.results).children, v19);
    table.insert(v17.nodeStack, v19);
    table.insert(v17.contextStack, (v2.new(v17.contextStack[#v17.contextStack])));
    table.insert(v17.expectationContextStack, (v3.new(v17.expectationContextStack[#v17.expectationContextStack])));
end;
v4.popNode = function(v20)
    assert(#v20.nodeStack > 0, "Tried to pop from an empty node stack");
    table.remove(v20.nodeStack, #v20.nodeStack);
    table.remove(v20.contextStack, #v20.contextStack);
    table.remove(v20.expectationContextStack, #v20.expectationContextStack);
end;
v4.getContext = function(v21)
    assert(#v21.contextStack > 0, "Tried to get context from an empty stack");
    return v21.contextStack[#v21.contextStack];
end;
v4.getExpectationContext = function(v22)
    assert(#v22.expectationContextStack > 0, "Tried to get expectationContext from an empty stack");
    return v22.expectationContextStack[#v22.expectationContextStack];
end;
v4.shouldSkip = function(v23)
    if not v23.hasFocusNodes then
        for v24 = #v23.nodeStack, 1, -1 do
            if v23.nodeStack[v24].planNode.modifier == v0.NodeModifier.Skip then
                return true;
            end;
        end;
        return false;
    else
        for v25 = #v23.nodeStack, 1, -1 do
            local v26 = v23.nodeStack[v25];
            if v26.planNode.modifier == v0.NodeModifier.Skip then
                return true;
            elseif v26.planNode.modifier == v0.NodeModifier.Focus then
                return false;
            end;
        end;
        return true;
    end;
end;
v4.setSuccess = function(v27)
    assert(#v27.nodeStack > 0, "Attempting to set success status on empty stack");
    v27.nodeStack[#v27.nodeStack].status = v0.TestStatus.Success;
end;
v4.setSkipped = function(v28)
    assert(#v28.nodeStack > 0, "Attempting to set skipped status on empty stack");
    v28.nodeStack[#v28.nodeStack].status = v0.TestStatus.Skipped;
end;
v4.setError = function(v29, v30)
    assert(#v29.nodeStack > 0, "Attempting to set error status on empty stack");
    local v31 = v29.nodeStack[#v29.nodeStack];
    v31.status = v0.TestStatus.Failure;
    table.insert(v31.errors, v30);
end;
v4.addDummyError = function(v32, v33, v34)
    v32:pushNode({
        type = v0.NodeType.It, 
        phrase = v33
    });
    v32:setError(v34);
    v32:popNode();
    v32.nodeStack[#v32.nodeStack].status = v0.TestStatus.Failure;
end;
v4.setStatusFromChildren = function(v35)
    assert(#v35.nodeStack > 0, "Attempting to set status from children on empty stack");
    local v36 = v35.nodeStack[#v35.nodeStack];
    local l_Success_0 = v0.TestStatus.Success;
    local v38 = true;
    for _, v40 in ipairs(v36.children) do
        if v40.status ~= v0.TestStatus.Skipped then
            v38 = false;
            if v40.status == v0.TestStatus.Failure then
                l_Success_0 = v0.TestStatus.Failure;
            end;
        end;
    end;
    if v38 then
        l_Success_0 = v0.TestStatus.Skipped;
    end;
    v36.status = l_Success_0;
end;
return v4;
