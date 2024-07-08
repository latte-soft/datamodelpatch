local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.AssetTraversalUtils);
local v3 = require(l_Parent_0.ConstantsInterface);
return function(v4, v5, v6)
    local v7 = {};
    if Enum.AssetType.DynamicHead == v6 then
        v2.calculateBounds(v6, v5, CFrame.new(), v7);
        v4.Position = v5.Position;
        v4.Size = v5.Size;
    else
        local v8 = v2.assetHierarchy[v6];
        v2.traverseHierarchy(nil, v5, v6, nil, CFrame.new(), v8.root, v8, v7);
        local function v9(v10, v11, v12, v13, v14)
            local l_v10_FirstChild_0 = v10:FindFirstChild(v13);
            local l_v12_0 = v12;
            if v11 then
                local l_v10_FirstChild_1 = v10:FindFirstChild(v11);
                local v18 = v3.getRigAttachmentToParent(v6, v13);
                l_v12_0 = (l_v12_0 * l_v10_FirstChild_1:FindFirstChild(v18).CFrame) * l_v10_FirstChild_0:FindFirstChild(v18).CFrame:Inverse();
            end;
            l_v10_FirstChild_0.CFrame = l_v12_0;
            if v14.children then
                for v19, v20 in v14.children, nil, nil do
                    v9(v10, v13, l_v12_0, v19, v20);
                end;
            end;
        end;
        v9(v5, nil, CFrame.new(), v8.root, v8);
        local v21 = Vector3.new();
        local v22 = Vector3.new();
        v21 = if not v7.maxOverall then Vector3.new() else v7.maxOverall;
        v22 = if not v7.minOverall then Vector3.new() else v7.minOverall;
        if not (v7.minOverall ~= nil) or v7.maxOverall == nil then
            return false;
        else
            v4.Size = Vector3.new(v21.X - v22.X, v21.Y - v22.Y, v21.Z - v22.Z);
            v4.Position = Vector3.new(v22.X + v4.Size.X / 2, v22.Y + v4.Size.Y / 2, v22.Z + v4.Size.Z / 2);
        end;
    end;
    return true;
end;
