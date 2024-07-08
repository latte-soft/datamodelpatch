return require(script.Parent.Object.assign)({}, require(script.makeTimerImpl)(task.delay), require(script.makeIntervalImpl)(task.delay));
