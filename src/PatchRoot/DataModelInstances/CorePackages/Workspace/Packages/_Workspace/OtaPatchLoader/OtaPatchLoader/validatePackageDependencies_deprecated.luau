return function(v0, v1)
    v1 = v1 or game:GetService("CorePackages");
    assert(v1, "corePackages should always exist");
    local l_v1_FirstChild_0 = v1:FindFirstChild("_GlobalPackageVersions", false);
    if l_v1_FirstChild_0 then
        local v3 = require(l_v1_FirstChild_0);
        local l_v0_FirstChild_0 = v0:FindFirstChild("_RequiredDependencyVersions", false);
        if l_v0_FirstChild_0 then
            local v5 = require(l_v0_FirstChild_0);
            local l_FileVersion_0 = v3.FileVersion;
            local l_FileVersion_1 = v5.FileVersion;
            if l_FileVersion_0 == 0 then
                return false, (("invalid global packages version %*"):format(l_FileVersion_0));
            elseif l_FileVersion_1 == 0 then
                return false, (("invalid patch packages version %*"):format(l_FileVersion_1));
            else
                if l_FileVersion_1 <= l_FileVersion_0 then
                    local l_MaxAppVersion_0 = v3.MaxAppVersion;
                    local l_IsDota_0 = v3.IsDota;
                    local l_MaxAppVersion_1 = v5.MaxAppVersion;
                    if l_IsDota_0 then
                        if l_MaxAppVersion_0 and l_MaxAppVersion_1 then
                            if l_MaxAppVersion_1 < l_MaxAppVersion_0 then
                                return false, (("global packages are newer than the patch (patch: %* <= global: %*), (patch app: %* < global app: %*)"):format(v5.FileVersion, v3.FileVersion, l_MaxAppVersion_1, l_MaxAppVersion_0));
                            end;
                        else
                            return false, (("global packages are newer than the patch (patch: %* <= global: %*), app versions missing"):format(v5.FileVersion, v3.FileVersion));
                        end;
                    else
                        return false, (("global packages are newer than the patch (patch: %* <= global: %*), not DOTA"):format(v5.FileVersion, v3.FileVersion));
                    end;
                end;
                local l_Packages_0 = v3.Packages;
                for v12, v13 in pairs(v5.Packages) do
                    if not (l_Packages_0[v12] ~= nil) or l_Packages_0[v12].source_hash == nil then
                        return false, (("hash for %* missing in global packages"):format(v12));
                    elseif v13.source_hash == nil then
                        return false, (("hash for %* missing in patch packages"):format(v12));
                    elseif v13.source_hash ~= l_Packages_0[v12].source_hash then
                        return false, (("hash mismatch for %*. Patch: [%*]; Global: [%*]."):format(v12, v13.source_hash, l_Packages_0[v12].source_hash));
                    end;
                end;
                return true, "";
            end;
        else
            return false, "_RequiredDependencyVersions not found in patch.";
        end;
    else
        return false, "_GlobalPackageVersions not found in CorePackages";
    end;
end;
