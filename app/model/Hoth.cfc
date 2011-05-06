/**
 * @singleton
 * @accessors true
 */
component {

	property applicationName;
	property logPath;
	property logPathIsRelative;
	property email;
	property enabled;

	public any function init() {

		// create a basic config with sensible defaults
		config = new hoth.config.HothConfig();
		config.setApplicationName(coldmvc.cgi.get("server_name"));
		config.setLogPath(expandPath("/config/../logs/"));
		config.setLogPathIsRelative(false);
	    config.setEmailNewExceptions(true);

		return this;

	}

	public void function setApplicationName(required string applicationName) {

		config.setApplicationName(arguments.applicationName);

	}

	public void function setLogPath(required string logPath) {

		config.setLogPath(arguments.logPath);

	}

	public void function setLogPathIsRelative(required boolean logPathIsRelative) {

		config.setLogPathIsRelative(arguments.logPathIsRelative);

	}

	public void function setEmail(required struct email) {

		if (structKeyExists(arguments.email, "from")) {
			config.setEmailNewExceptionsFrom(arguments.email.from);
		}

		if (structKeyExists(arguments.email, "to")) {
			config.setEmailNewExceptionsTo(arguments.email.to);
		}

	}

	/**
	 * @events error
	 */
	public void function track() {

		// the tracker is not enabled by default, but can enabled through config
		if (!structKeyExists(variables, "enabled")) {

			// enable tracking by default when not in development environment
			variables.enabled = !coldmvc.config.get("development");

		}

		if (variables.enabled) {

			if (!structKeyExists(variables, "tracker")) {
				variables.tracker = new hoth.HothTracker(config);
			}

			variables.tracker.track(params.error);

		}

	}

}