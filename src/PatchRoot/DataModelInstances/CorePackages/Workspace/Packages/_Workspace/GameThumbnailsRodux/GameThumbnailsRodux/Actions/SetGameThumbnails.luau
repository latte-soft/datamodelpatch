return require(script:FindFirstAncestor("GameThumbnailsRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", string.format("SetGameThumbnails action expects thumbnailsTable to be a table, was %s", (type(v0))));
    return {
        thumbnails = v0
    };
end);
