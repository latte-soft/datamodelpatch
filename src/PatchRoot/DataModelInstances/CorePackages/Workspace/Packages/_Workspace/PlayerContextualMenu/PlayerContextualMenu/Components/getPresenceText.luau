local _ = require(script.Parent.Types);
return function(v1)
    if not v1 then
        return "";
    elseif not (v1.status ~= "InGame") or v1.status == "InStudio" then
        return v1.locationString;
    elseif v1.status == "Online" then
        return "Online";
    else
        return "Offline";
    end;
end;
