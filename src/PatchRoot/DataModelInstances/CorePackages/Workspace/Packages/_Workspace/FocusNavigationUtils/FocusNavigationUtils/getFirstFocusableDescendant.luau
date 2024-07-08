return function(v0)
    for _, v2 in v0:GetDescendants() do
        if not ((not v2:IsA("GuiObject") or not v2.Selectable) or not v2.Visible) then
            return v2;
        end;
    end;
    return nil;
end;
