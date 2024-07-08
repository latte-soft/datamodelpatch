local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
return function(v4)
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, v4);
    local v6 = v2.new();
    for _, v8 in pairs(l_v4_Descendants_0) do
        if v8:IsA("MeshPart") then
            local v9 = v8.TextureID ~= "";
            local l_SurfaceAppearance_0 = v8:FindFirstChildWhichIsA("SurfaceAppearance");
            if not v3() then
                if not v9 then
                    if not l_SurfaceAppearance_0 then
                        v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance);
                        v6:updateReasons(false, {
                            (("(%*) has an empty TextureID, so must have a child SurfaceAppearance"):format((v8:GetFullName())))
                        });
                    end;
                elseif l_SurfaceAppearance_0 then
                    v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MeshPartHasTexture);
                    v6:updateReasons(false, {
                        (("SurfaceAppearance's parent (%*) must have an empty TextureID"):format((v8:GetFullName())))
                    });
                end;
            elseif not v9 then
                if not l_SurfaceAppearance_0 then
                    v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance);
                    v6:updateReasons(false, {
                        (("(%*) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them."):format((v8:GetFullName())))
                    });
                end;
            elseif l_SurfaceAppearance_0 then
                v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MeshPartHasTexture);
                v6:updateReasons(false, {
                    (("TextureID and SurfaceAppearance are both defined for MeshPart (%*). Publishing will only use SurfaceApperance."):format((v8:GetFullName())))
                });
            end;
        end;
    end;
    return v6:getFinalResults();
end;
