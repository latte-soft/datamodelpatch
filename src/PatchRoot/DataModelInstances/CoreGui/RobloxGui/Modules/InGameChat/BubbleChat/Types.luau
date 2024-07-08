local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = {
    IMessage = v0.strictInterface({
        id = v0.string, 
        name = v0.string, 
        text = v0.string, 
        userId = v0.string, 
        timestamp = v0.number, 
        adornee = v0.union(v0.instanceIsA("BasePart"), v0.instanceOf("Model"))
    }), 
    IMessageData = v0.interface({
        ID = v0.number, 
        SpeakerUserId = v0.number, 
        FromSpeaker = v0.string, 
        Time = v0.number, 
        Message = v0.optional(v0.string)
    })
};
local v2 = {
    BubbleDuration = v0.optional(v0.number), 
    MaxBubbles = v0.optional(v0.number), 
    BackgroundColor3 = v0.optional(v0.Color3), 
    TextColor3 = v0.optional(v0.Color3), 
    TextSize = v0.optional(v0.number), 
    Font = v0.optional(v0.enum(Enum.Font)), 
    Transparency = v0.optional(v0.number), 
    CornerEnabled = v0.optional(v0.boolean), 
    CornerRadius = v0.optional(v0.UDim), 
    TailVisible = v0.optional(v0.boolean), 
    Padding = v0.optional(v0.number), 
    MaxWidth = v0.optional(v0.number), 
    BackgroundImage = v0.optional(v0.strictInterface({
        Image = v0.optional(v0.string), 
        ImageColor3 = v0.optional(v0.Color3), 
        ImageRectOffset = v0.optional(v0.Vector2), 
        ImageRectSize = v0.optional(v0.Vector2), 
        ScaleType = v0.optional(v0.enum(Enum.ScaleType)), 
        SliceCenter = v0.optional(v0.Rect), 
        SliceScale = v0.optional(v0.number), 
        TileSize = v0.optional(v0.UDim2)
    })), 
    BackgroundGradient = v0.optional(v0.strictInterface({
        Enabled = v0.optional(v0.boolean), 
        Color = v0.optional(v0.ColorSequence), 
        Offset = v0.optional(v0.Vector2), 
        Rotation = v0.optional(v0.number), 
        Transparency = v0.optional(v0.NumberSequence)
    })), 
    SizeAnimation = v0.optional(v0.strictInterface({
        Enabled = v0.optional(v0.boolean), 
        SpringDampingRatio = v0.optional(v0.number), 
        SpringFrequency = v0.optional(v0.number)
    })), 
    TransparencyAnimation = v0.optional(v0.strictInterface({
        Enabled = v0.optional(v0.boolean), 
        SpringDampingRatio = v0.optional(v0.number), 
        SpringFrequency = v0.optional(v0.number)
    })), 
    VerticalStudsOffset = v0.optional(v0.number), 
    LocalPlayerStudsOffset = v0.optional(v0.Vector3), 
    BubblesSpacing = v0.optional(v0.number), 
    MinimizeDistance = v0.optional(v0.number), 
    MaxDistance = v0.optional(v0.number), 
    AdorneeName = v0.optional(v0.string), 
    Voice = v0.optional(v0.strictInterface({
        ShowIndicator = v0.optional(v0.boolean)
    }))
};
local v3 = {};
for v4, v5 in pairs(v2) do
    v3[v4] = v5;
end;
v2.UserSpecificSettings = v0.optional(v0.map(v0.string, v0.strictInterface(v3)));
v1.IChatSettings = v0.strictInterface(v2);
return v1;
