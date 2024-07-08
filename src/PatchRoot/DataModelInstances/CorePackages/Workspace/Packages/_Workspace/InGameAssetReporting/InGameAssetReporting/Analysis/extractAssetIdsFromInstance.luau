local _ = require(script:FindFirstAncestor("InGameAssetReporting").Analysis.Types);
extractAssetIdsFromInstance = function(v1)
    local v2 = {
        Package = {}, 
        Model = {}, 
        Image = {}, 
        Mesh = {}
    };
    if (v1:IsA("PackageLink") and v1.PackageId ~= "") and v1.VersionNumber > 0 then
        table.insert(v2.Package, {
            id = v1.PackageId, 
            version = v1.VersionNumber
        });
        return v2;
    elseif v1:IsA("Model") and v1.SourceAssetId > 0 then
        table.insert(v2.Model, (tostring(v1.SourceAssetId)));
        return v2;
    else
        if v1:IsA("MeshPart") and v1.MeshId ~= "" then
            table.insert(v2.Mesh, v1.MeshId);
            if v1.TextureID ~= "" then
                table.insert(v2.Image, v1.TextureID);
                return v2;
            end;
        elseif (not (v1.ClassName ~= "FileMesh") or v1.ClassName == "SpecialMesh" and v1.MeshType == Enum.MeshType.FileMesh) and v1.MeshId ~= "" then
            table.insert(v2.Mesh, v1.MeshId);
            if v1.TextureId ~= "" then
                table.insert(v2.Image, v1.TextureId);
                return v2;
            end;
        elseif v1:IsA("ImageLabel") and v1.Image ~= "" then
            table.insert(v2.Image, v1.Image);
            return v2;
        elseif not v1:IsA("ImageButton") then
            if v1:IsA("Decal") and v1.Texture ~= "" then
                table.insert(v2.Image, v1.Texture);
                return v2;
            elseif v1:IsA("SurfaceAppearance") and v1.ColorMap ~= "" then
                table.insert(v2.Image, v1.ColorMap);
                return v2;
            else
                return nil;
            end;
        else
            if v1.Image ~= "" then
                table.insert(v2.Image, v1.Image);
            end;
            if v1.HoverImage ~= "" then
                table.insert(v2.Image, v1.HoverImage);
            end;
            if v1.PressedImage ~= "" then
                table.insert(v2.Image, v1.PressedImage);
                return v2;
            end;
        end;
        return v2;
    end;
end;
return extractAssetIdsFromInstance;
