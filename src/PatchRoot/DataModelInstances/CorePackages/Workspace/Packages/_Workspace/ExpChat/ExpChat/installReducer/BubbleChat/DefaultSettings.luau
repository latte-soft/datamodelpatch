return {
    BackgroundColor3 = Color3.fromRGB(250, 250, 250), 
    MaxBubbles = 3, 
    BackgroundTransparency = if not require(script:FindFirstAncestor("ExpChat").Flags.getEnableChatInputBarConfigurationStyleCustomizations)() then nil else 0.1, 
    Transparency = 0.1, 
    TailVisible = true, 
    Padding = 8, 
    MaxWidth = 300, 
    BubbleDuration = 15, 
    AdorneeName = "HumanoidRootPart", 
    MaxDistance = 100, 
    MinimizeDistance = 50, 
    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"), 
    SizeAnimation = {
        Enabled = true, 
        SpringDampingRatio = 1, 
        SpringFrequency = 2
    }, 
    TransparencyAnimation = {
        Enabled = true, 
        SpringDampingRatio = 1, 
        SpringFrequency = 2
    }, 
    Voice = {
        ShowIndicator = true
    }, 
    UserSpecificSettings = {}
};
