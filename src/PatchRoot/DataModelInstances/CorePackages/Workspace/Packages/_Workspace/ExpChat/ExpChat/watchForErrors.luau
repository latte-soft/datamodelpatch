local v0 = require(script:FindFirstAncestor("ExpChat").Analytics);
return function(v1, v2, v3)
    v1.Error:Connect(function(_, v5, v6)
        if not (v6 ~= v2 and (not v5 or not string.find(v5, "ExpChat"))) then
            v0.reportCounter(not v3 and "expChatErrorCountClient" or "expChatErrorCountServer");
        end;
    end);
end;
