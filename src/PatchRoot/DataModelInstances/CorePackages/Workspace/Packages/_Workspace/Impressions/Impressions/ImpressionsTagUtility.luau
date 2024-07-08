local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require(script.Parent.Constants);
return {
    AddTag = function(v2, v3, v4)
        local v5 = not not v2 and v2.current or nil;
        if not (not v3 or not v5) then
            if not v4 then
                warn("addTag: impression instance not tagged, missing index");
            else
                v5:SetAttribute(v1.ItemIndex, v4);
                if not l_CollectionService_0:HasTag(v5, v3) then
                    l_CollectionService_0:AddTag(v5, v3);
                    return ;
                end;
            end;
        end;
    end, 
    RemoveTag = function(v6, v7, v8)
        local v9 = not not v6 and v6.current or nil;
        if not (not v7 or not v9) then
            if v8 then
                v9:SetAttribute(v1.ItemIndex, nil);
            end;
            l_CollectionService_0:RemoveTag(v9, v7);
        end;
    end
};
