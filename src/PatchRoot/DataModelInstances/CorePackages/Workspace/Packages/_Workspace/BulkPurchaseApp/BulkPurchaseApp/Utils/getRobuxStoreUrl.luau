local v0 = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www.");
return function()
    return ("%sUpgrades/Robux.aspx"):format(v0);
end;
