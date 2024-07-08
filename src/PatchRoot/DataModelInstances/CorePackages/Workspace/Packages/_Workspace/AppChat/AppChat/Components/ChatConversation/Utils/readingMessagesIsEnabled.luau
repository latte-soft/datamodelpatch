return function(v0)
    if v0 then
        return v0.getScreenProps("isVisible", false) or not v0.getScreenProps("wideMode", false);
    else
        return false;
    end;
end;
