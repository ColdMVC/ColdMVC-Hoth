A Hoth plugin for ColdMVC

Exception tracking for ColdFusion

https://github.com/aarongreenlee/Hoth

* Usage:

Download Hoth and put it in your web root or add a server mapping for /Hoth.

Download the Hoth plugin for ColdMVC and put it inside your _/plugins_ folder.

Update your app's _/config/plugins.cfm_ with the following.

	<cfset add("hoth") />

Update your app's _/config/config.ini_ to include your own email settings. This is required for the plugin to work correctly.

	[default]
	hoth.email.from = errors@my-site.com
	hoth.email.to = admin@my-site.com

* Notes

By default, emails will not be sent out while in development mode. You can override this setting inside your app's _/config/config.ini_.

	[development]
	hoth.enabled = true
	
Be default, Hoth will create log files inside a _/logs_ folder directly inside your app's root. You can override this setting inside your app's _/config/config.ini_.

	[production]
	hoth.logPath = C:\inetpub\logs


Copyright 2010 Tony Nelson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.