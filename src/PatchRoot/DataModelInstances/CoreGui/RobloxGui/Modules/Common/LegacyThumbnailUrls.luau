return {
    Headshot = "rbxthumb://type=AvatarHeadShot&id=%d&w=%d&h=%d", 
    Bust = string.gsub(string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "/www.", "/thumbnails."), "http:", "https:") .. "v1/users/avatar-bust?userIds=%d&size=%dx%d&format=Png&isCircular=false", 
    Thumbnail = "rbxthumb://type=Avatar&id=%d&w=%d&h=%d"
};
