# This is a placeholder class.
#class bash_config_scripts($username) {
class mybashconfig($username) {
	#anchor { 'Hello_World': }
	file { "/Users/$username/config":
	  source  => "puppet://config",
	  recurse => true,
	}
}
