local v0 = {
    Templates = {
        ItemGroup = "ItemGroup", 
        Button = "Button"
    }, 
    Types = {
        ProfilePictureEditorWidget = "ProfilePictureEditorWidget", 
        TrendingWidget = "TrendingWidget", 
        NewToMarketplaceWidget = "NewToMarketplaceWidget", 
        SearchToLooksWidget = "SearchToLooksWidget", 
        SearchToAvatarLooksWidget = "SearchToAvatarLooksWidget", 
        InExperienceShopWidget = "InExperienceShopWidget", 
        SearchToCommunityLooksWidget = "SearchToCommunityLooksWidget"
    }, 
    ActionType = {
        IMPRESSION = 0, 
        ITEM_CLICK = 1, 
        WIDGET_CLICK = 2, 
        PURCHASE_SUCCESS = 3, 
        ITEM_DESELECTED = 4, 
        PURCHASE_ATTEMPT = 5
    }, 
    ContentType = {
        Asset = "Asset", 
        Bundle = "Bundle", 
        Experience = "Experience", 
        Look = "Look"
    }
};
v0.TypeToImageInfo = {
    [v0.Types.ProfilePictureEditorWidget] = {
        backgroundImageDark = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png", 
        backgroundImageLight = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
        contentImageDark = "rbxasset://textures/ui/AvatarExperience/Profile_Picture_Group.png", 
        contentImageLight = "rbxasset://textures/ui/AvatarExperience/Profile_Picture_Group_Light.png", 
        rowScale = 0.7, 
        widthHeightRatio = 1.91
    }
};
return v0;
