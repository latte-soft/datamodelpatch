local v0 = require(script.Parent.Parent.flags.getFFlagUGCValidationMeshPartAccessoryUploads);
return function(v1)
    if not v0() then
        if not (not (v1 and typeof(v1) == "Instance") or not v1:IsA("Accessory")) then
            local l_Handle_0 = v1:FindFirstChild("Handle");
            if not ((not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) or not l_Handle_0:FindFirstChildOfClass("WrapLayer")) then
                return true;
            end;
        end;
        return false;
    else
        return v1:FindFirstChildWhichIsA("WrapLayer", true);
    end;
end;
