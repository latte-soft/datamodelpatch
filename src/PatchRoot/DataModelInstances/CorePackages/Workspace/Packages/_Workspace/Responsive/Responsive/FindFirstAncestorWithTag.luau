FindFirstAncestorWithTag = function(v0, v1)
    if v0 == nil then
        return nil;
    elseif not v0:HasTag(v1) then
        return FindFirstAncestorWithTag(v0.Parent, v1);
    else
        return v0;
    end;
end;
return FindFirstAncestorWithTag;
