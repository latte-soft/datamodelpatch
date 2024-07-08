local v0 = require(script.Parent.Parent.Analytics);
local v1 = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default");
return function(v2)
    local l_v2_Descendants_0 = v2:GetDescendants();
    table.insert(l_v2_Descendants_0, 1, v2);
    local l_Default_0 = Enum.CollisionFidelity.Default;
    pcall(function()
        l_Default_0 = Enum.CollisionFidelity[v1];
    end);
    local v5 = {};
    for _, v7 in l_v2_Descendants_0, nil, nil do
        if v7:IsA("MeshPart") and v7.CollisionFidelity ~= l_Default_0 then
            table.insert(v5, (("Expected %*.CollisionFidelity to be %*"):format(v7:GetFullName(), l_Default_0.Name)));
        end;
    end;
    if #v5 == 0 then
        return true;
    else
        v0.reportFailure(v0.ErrorType.validateBodyPartCollisionFidelity);
        return false, v5;
    end;
end;
