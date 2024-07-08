return function(v0)
    if v0.title == nil then
        return false;
    elseif v0.imageUrl == nil then
        return false;
    elseif v0.pagePath == nil then
        return false;
    else
        return true;
    end;
end;
