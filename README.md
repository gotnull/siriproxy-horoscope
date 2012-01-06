PunchFork Random Recipe Generator, Siri style!
==============================================

This is a plugin for SiriProxy that returns a random recipe from the PunchFork API (http://www.punchfork.com/api)

Setup
-----

1. Copy the contents of `config-info.yml` into your `~/.siriproxy/config.yml`.
2. rvmsudo siriproxy update.
3. Restart SiriProxy.

Requirements
------------

You'll need to register an account and obtain an API Key from http://punchfork.com/api in order to use this plugin.

NOTE: The Punchfork API limits the number of queries a single key can execute per day. For a **free price** you get a maximum of **500 API calls/day**.

More info can be found here: http://punchfork.com/api#pricing

Usage
-----

**Say:** Siri, what's for dinner? or Siri, what's to eat?

Will return a random recipe from the PunchFork API.