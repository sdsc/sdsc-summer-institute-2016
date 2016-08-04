# Configuration file for ipcontroller.

c = get_config()

# The IP address for registration.  This is generally either '127.0.0.1' for
# loopback only or '*' for all interfaces.
c.HubFactory.ip = u'*'
