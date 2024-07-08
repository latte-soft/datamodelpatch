local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.calculateMinMax);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateFullBody);
local v17 = {
    calculateBounds = function(v5, v6, v7, v8)
        local v9, v10 = v2(v8.minMeshCorner, v8.maxMeshCorner, v7:PointToWorldSpace(-(v6.Size / 2)), v7:PointToWorldSpace(-(v6.Size / 2)));
        v8.minMeshCorner = v9;
        v8.maxMeshCorner = v10;
        v9, v10 = v2(v8.minMeshCorner, v8.maxMeshCorner, v7:PointToWorldSpace(v6.Size / 2), v7:PointToWorldSpace(v6.Size / 2));
        v8.minMeshCorner = v9;
        v8.maxMeshCorner = v10;
        for _, v12 in v3.getAttachments(v5, v6.Name) do
            local l_v6_FirstChild_0 = v6:FindFirstChild(v12);
            assert(l_v6_FirstChild_0);
            if string.match(l_v6_FirstChild_0.Name, "RigAttachment$") ~= nil then
                local v14 = v7 * l_v6_FirstChild_0.CFrame;
                local v15, v16 = v2(v8.minRigAttachment, v8.maxRigAttachment, v14.Position, v14.Position);
                v8.minRigAttachment = v15;
                v8.maxRigAttachment = v16;
            end;
        end;
        v9, v10 = v2(v8.minOverall, v8.maxOverall, v8.minMeshCorner, v8.maxMeshCorner);
        v8.minOverall = v9;
        v8.maxOverall = v10;
        v9, v10 = v2(v8.minOverall, v8.maxOverall, v8.minRigAttachment, v8.maxRigAttachment);
        v8.minOverall = v9;
        v8.maxOverall = v10;
    end
};
v17.traverseHierarchy = function(v18, v19, v20, v21, v22, v23, v24, v25)
    if v4() then
        assert((v18 ~= nil) ~= ((v19 and v20) ~= nil));
    end;
    local v26 = nil;
    v26 = if not not v4() and v18 then v18[v23] else v19:FindFirstChild(v23);
    assert(v26);
    local l_v22_0 = v22;
    if not v21 then
        l_v22_0 = CFrame.new();
    else
        local v28 = nil;
        v28 = if not not v4() and v18 then v18[v21] else v19:FindFirstChild(v21);
        assert(v28);
        local v29 = v3.getRigAttachmentToParent(v20, v23);
        local l_v28_FirstChild_0 = v28:FindFirstChild(v29);
        assert(l_v28_FirstChild_0);
        local l_v26_FirstChild_0 = v26:FindFirstChild(v29);
        assert(l_v26_FirstChild_0);
        l_v22_0 = (l_v22_0 * l_v28_FirstChild_0.CFrame) * l_v26_FirstChild_0.CFrame:Inverse();
    end;
    v17.calculateBounds(v20, v26, l_v22_0, v25);
    if v24.children then
        for v32, v33 in v24.children, nil, nil do
            v17.traverseHierarchy(v18, v19, v20, v23, l_v22_0, v32, v33, v25);
        end;
    end;
end;
v17.assetHierarchy = {
    [Enum.AssetType.DynamicHead] = {
        root = "Head"
    }, 
    [Enum.AssetType.Torso] = {
        root = "LowerTorso", 
        children = {
            UpperTorso = {}
        }
    }, 
    [Enum.AssetType.LeftArm] = {
        root = "LeftUpperArm", 
        children = {
            LeftLowerArm = {
                children = {
                    LeftHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightArm] = {
        root = "RightUpperArm", 
        children = {
            RightLowerArm = {
                children = {
                    RightHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.LeftLeg] = {
        root = "LeftUpperLeg", 
        children = {
            LeftLowerLeg = {
                children = {
                    LeftFoot = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightLeg] = {
        root = "RightUpperLeg", 
        children = {
            RightLowerLeg = {
                children = {
                    RightFoot = {}
                }
            }
        }
    }
};
return v17;
