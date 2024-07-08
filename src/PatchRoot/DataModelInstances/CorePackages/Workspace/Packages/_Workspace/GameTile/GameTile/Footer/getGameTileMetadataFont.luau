return function(v0, v1)
    if not v0 then
        return v1.Semantic.Typography.CaptionHeader;
    else
        return v1.Semantic.Typography.Body;
    end;
end;
