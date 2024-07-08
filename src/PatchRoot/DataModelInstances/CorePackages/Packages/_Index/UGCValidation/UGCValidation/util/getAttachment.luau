local v0 = require(script.Parent.Parent.flags.getFFlagUGCValidationMeshPartAccessoryUploads);
return function(v1, v2)
    for _, v4 in pairs(v2) do
        local l_v1_FirstChild_0 = v1:FindFirstChild(v4);
        if l_v1_FirstChild_0 then
            if not v0() or not l_v1_FirstChild_0:IsA("Attachment") then
                return l_v1_FirstChild_0;
            else
                return l_v1_FirstChild_0;
            end;
        end;
    end;
    return nil;
end;
