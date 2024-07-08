local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(script.Parent.MediaGallerySingle);
local v4 = require(script.Parent.MediaGalleryCarousel);
local v5 = {
    layoutMode = "Gallery"
};
return function(v6)
    local v7 = v1.Dictionary.join(v5, v6);
    if v7.layoutMode == "Carousel" then
        return v2.createElement(v4, v7);
    else
        return v2.createElement(v3, v7);
    end;
end;
