/**
 * @singleton
 */
component accessors="true" {

	property applicationName;

	/**
	 * @inject coldmvc
	 */
	property coldmvc;

	property logPath;
	property logPathIsRelative;
	property email;
	property enabled;

	public any function init() {

		// create a basic config with sensible defaults
		variables.config = new hoth.config.HothConfig();
		variables.config.setApplicationName(coldmvc.cgi.get("server_name"));
		variables.config.setLogPath(expandPath("/config/../logs/"));
		variables.config.setLogPathIsRelative(false);
	    variables.config.setEmailNewExceptions(true);

		return this;

	}

	public void function setApplicationName(required string applicationName) {

		variables.config.setApplicationName(arguments.applicationName);

	}

	public void function setLogPath(required string logPath) {

		variables.config.setLogPath(arguments.logPath);

	}

	public void function setLogPathIsRelative(required boolean logPathIsRelative) {

		variables.config.setLogPathIsRelative(arguments.logPathIsRelative);

	}

	public void function setEmail(required struct email) {

		if (structKeyExists(arguments.email, "from")) {
			variables.config.setEmailNewExceptionsFrom(arguments.email.from);
		}

		if (structKeyExists(arguments.email, "to")) {
			variables.config.setEmailNewExceptionsTo(arguments.email.to);
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
				variables.tracker = new hoth.HothTracker(variables.config);
			}

			variables.tracker.track(params.error);

		}

	}

}