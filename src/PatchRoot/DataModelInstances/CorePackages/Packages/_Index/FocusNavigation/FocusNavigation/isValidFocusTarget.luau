return function(v0)
    if v0 then
        if v0:IsA("GuiBase2d") then
            if v0:FindFirstAncestorWhichIsA("LayerCollector") then
                if v0:FindFirstAncestorWhichIsA("BasePlayerGui") then
                    return true;
                else
                    return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui";
                end;
            else
                return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui";
            end;
        else
            return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", v0.ClassName);
        end;
    else
        return false, "`nil` value provided to isValidFocusTarget";
    end;
end;
