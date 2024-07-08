local l_List_0 = require(script:FindFirstAncestor("ExpChat").Parent.llama).List;
return function(v1)
    return l_List_0.count(v1:GetChildren(), function(v2)
        return v2:IsA("TextSource");
    end);
end;
