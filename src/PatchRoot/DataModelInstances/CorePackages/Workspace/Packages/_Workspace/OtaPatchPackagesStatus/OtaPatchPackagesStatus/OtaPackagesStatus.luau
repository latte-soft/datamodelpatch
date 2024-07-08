local v0 = {
    None = "0", 
    All = "1", 
    Partial = "2"
};
local v1 = {
    PackagesByPatch = {}
};
v1.AddPackageStatus = function(v2, v3, v4)
    if v2 then
        if v3 then
            if not v1.PackagesByPatch[v2] then
                v1.PackagesByPatch[v2] = {};
            end;
            v1.PackagesByPatch[v2][v3] = v4 or false;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v1.AllPatchPackagesLoaded = function(v5)
    if v5 then
        local v6 = v1.PackagesByPatch[v5];
        if v6 then
            local v7 = 0;
            local v8 = 0;
            for _, v10 in v6, nil, nil do
                if not v10 then
                    v8 = v8 + 1;
                else
                    v7 = v7 + 1;
                end;
            end;
            if v7 == 0 then
                return v0.None;
            elseif v8 == 0 then
                assert(v7 > 0, "Success <=0, should be impossible");
                return v0.All;
            else
                assert(v7 > 0, "Success <=0, should be impossible");
                assert(v8 > 0, "Failed <= 0, should be impossible");
                return v0.Partial;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return v1;
