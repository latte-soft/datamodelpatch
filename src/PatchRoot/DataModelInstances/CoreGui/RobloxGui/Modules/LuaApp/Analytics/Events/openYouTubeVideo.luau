return function(v0, v1, v2, v3, v4, v5)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    v0:setRBXEventStream(v1, "openYouTubeVideo", {
        videoTitle = v2, 
        videoID = v3, 
        universeId = v4, 
        interactionType = v5
    });
end;
