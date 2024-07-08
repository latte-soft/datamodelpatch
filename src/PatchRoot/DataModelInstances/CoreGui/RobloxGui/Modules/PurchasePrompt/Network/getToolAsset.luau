return function(v0, v1)
    return v0.loadAssetForEquip(v1):andThen(function(v2)
        if not v2:IsA("Tool") then
            for _, v4 in ipairs((v2:GetChildren())) do
                if v4:IsA("Tool") then
                    return v4;
                end;
            end;
            return ;
        else
            return v2;
        end;
    end):catch(function(_)
        return nil;
    end);
end;
